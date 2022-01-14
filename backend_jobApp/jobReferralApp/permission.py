from rest_framework.permissions import BasePermission, IsAuthenticated, SAFE_METHODS


class UserPermission(BasePermission):
    def has_permission(self, request, view):
        if view.action in ["get_current_user", "unactive_user", "upgrade_user", "get_courses_registered"]:
            return request.user.is_authenticated
        if view.action == 'reset_password':
            return True
        if request.method in SAFE_METHODS or view.action == "create":
            return True
        return request.user.is_authenticated