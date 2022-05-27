from rest_framework import permissions


class ReadOnlyOrIsAuthor(permissions.BasePermission):

    message = 'Изменения авторского контента запрещены.'

    def has_object_permission(self, request, view, obj):
        return (
            request.method in permissions.SAFE_METHODS
            or obj.author == request.user
        )
