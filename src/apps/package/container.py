from .services import package


def configure(binder):
    binder.bind('package', package.ServicePackage())
