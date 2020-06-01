import logging

from django.utils.translation import ugettext_lazy as _
from rest_framework import exceptions
from rest_framework.authentication import BaseAuthentication
from rest_framework.authentication import get_authorization_header

from apps.customer.models import CustomerToken


class CustomerTokenAuthentication(BaseAuthentication):
    """
    Simple token based authentication with Customer model.

    Clients should authenticate by passing the token key in the "Authorization"
    HTTP header, prepended with the string "Token ".  For example:

        Authorization: Token 401f7ac837da42b97f613d789819ff93537bee6a
        Authorization: 401f7ac837da42b97f613d789819ff93537bee6a
    """
    keyword = 'Token'
    model = CustomerToken

    def _token_from_header(self, request):
        logger = logging.getLogger('authenticate')
        header = get_authorization_header(request)
        auth = header.split()

        if not auth or len(auth) > 2:
            logger.debug('wrong authentication header: {}'.format(header))
            return None

        if auth is not None and len(auth) == 1:
            return auth[0].decode()

        if auth is None or len(auth) != 2:
            msg = _('Invalid token header. Token string should not contain spaces.')
            raise exceptions.AuthenticationFailed(msg)

        if auth is not None and len(auth) == 2:
            keyword = auth[0].decode()
            if keyword.lower() != self.keyword.lower():
                logger.debug('wrong header keyword: {} != {}'.format(keyword, self.keyword))
                return None
            return auth[1].decode()
        return None

    def authenticate_credentials(self, key):
        try:
            token = self.model.objects.get(token=key, expired=None)
        except self.model.DoesNotExist:
            raise exceptions.AuthenticationFailed(_('Invalid token.'))
        return (token.customer, token)

    def authenticate(self, request):

        try:
            logger = logging.getLogger('authenticate')
            token = self._token_from_header(request)
            logger.debug('token: {}'.format(token))
            if token is None or not len(token):
                return (None, None)

            customer, token = self.authenticate_credentials(token)
            logger.debug('customer: {}'.format(customer))
            request.customer = customer
            return (customer, token)

        except UnicodeError:
            msg = _('Invalid token header. Token string should not contain invalid characters.')
            raise exceptions.AuthenticationFailed(msg)
