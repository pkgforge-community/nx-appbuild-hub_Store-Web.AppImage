from rest_framework.permissions import BasePermission

from ..models import Customer


class IsAuthenticated(BasePermission):
    """
    Allows access only to authenticated users.
    """

    def has_permission(self, request, view):
        if hasattr(request, 'user'):
            return True

        if not hasattr(request, 'customer'):
            return False

        if request.customer is None:
            return False

        return type(request.customer) == Customer
