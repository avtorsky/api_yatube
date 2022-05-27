# Yatube API

[About](#about) /
[Changelog](#changelog) /
[Deploy](#deploy) /
[Testing](#testing) /
[Authentication](#authentication) /
[Posts](#posts) /
[Groups](#groups) /
[Comments](#comments)

## About
Backend API for [networking service concept](https://github.com/avtorsky/yatube) developed under the [Practicum](https://practicum.yandex.com/) online bootcamp with the following stack::
* Python 3.7.9
* Django Rest Framework 3.12.4
* SQLite 3.32.3

## Changelog
Release 20220528:
* feat(./yatube_api/): serializers, views, urlpatterns && routing setup
* docs(./README.md): .env setup && API specs complete

## Deploy

Clone repository && init the project:

```bash
git clone https://github.com/avtorsky/api_yatube.git
cd api_yatube
python -m venv venv
source venv/bin/activate
python3 -m pip install --upgrade pip
pip3 install -r requirements.txt
```

Setup the .env with SECRET_KEY and proceed:

```bash
python3 manage.py migrate
python3 manage.py createsuperuser
python3 manage.py runserver
```

## Testing

Run PEP8 linting && pytest pipe:

```bash
bash test_me.sh
```

## Authentication

```
POST /api/v1/api-token-auth/
```

Payload:

```json
{
    "username": "username",
    "password": "password"
}
```

Response:

```json
{
    "token": "token"
}
```

Basic errors:
* 400 Bad Request ```Обязательное поле.```
* 400 Bad Request ```Невозможно войти с предоставленными учетными данными.```

## Posts

```
GET /api/v1/posts/
```

Response:

```json
[
    {
        "id": 1,
        "text": "Hello, friend",
        "author": "author",
        "image": null,
        "group": null,
        "pub_date": "YYYY-MM-DDTHH:MM:SS.msZ"
    },
    {
        "id": 2,
        "text": "Hello, again, friend",
        "author": "author",
        "image": null,
        "group": null,
        "pub_date": "YYYY-MM-DDTHH:MM:SS.msZ"
    }
]
```

```
POST /api/v1/posts/
```

Payload:

```json
{
    "text": "Hello, friend"
}
```

Response:

```json
{
    "id": 1,
    "text": "Hello, friend",
    "author": "author",
    "image": null,
    "group": null,
    "pub_date": "YYYY-MM-DDTHH:MM:SS.msZ"
}
```

```
GET /api/v1/posts/{post_id}/
```

Response:

```json
{
    "id": 1,
    "text": "Hello, friend",
    "author": "author",
    "image": null,
    "group": null,
    "pub_date": "YYYY-MM-DDTHH:MM:SS.msZ"
}
```

```
PATCH /api/v1/posts/{post_id}/

Content-Type: multipart/form-data
Content-Disposition: form-data; name="image"; filename="image.jpg"
```

Response:

```json
{
    "id": 1,
    "text": "Hello, friend",
    "author": "author",
    "image": "http://127.0.0.1:8000/media/posts/image.jpg",
    "group": null,
    "pub_date": "YYYY-MM-DDTHH:MM:SS.msZ"
}
```

```
DELETE /api/v1/posts/{post_id}/
```

Basic errors:
* 400 Bad Request ```Обязательное поле.```
* 400 Bad Request ```Загруженный файл не является корректным файлом.```
* 401 Unauthorized ```Недопустимый токен.```
* 403 Forbidden ```Изменения авторского контента запрещены.```

## Groups

```
GET /api/v1/groups/
```

Response:

```json
[
    {
        "id": 1,
        "title": "group title",
        "slug": "slug",
        "description": "hello, friend"
    },
    ...
]
```

```
GET /api/v1/groups/{group_id}/
```

Response:

```json
{
    "id": 1,
    "title": "group title",
    "slug": "slug",
    "description": "hello, friend"
}
```

Basic errors:
* 401 Unauthorized ```Недопустимый токен.```
* 404 Not Found ```Ресурс не найден.```

## Comments

```
GET /api/v1/posts/{post_id}/comments/
```

Response:

```json
[
    {
        "id": 1,
        "author": "author",
        "post": 1,
        "text": "Hello, friend",
        "created": "YYYY-MM-DDTHH:MM:SS.msZ"
    },
    {
        "id": 2,
        "author": "author",
        "post": 1,
        "text": "Hello, again, friend",
        "created": "YYYY-MM-DDTHH:MM:SS.msZ"
    }
]
```

```
POST /api/v1/posts/{post_id}/comments/
```

Payload:

```json
{
    "text": "Hello, friend"
}
```

Response:

```json
{
    "id": 1,
    "author": "author",
    "post": 1,
    "text": "Hello, friend",
    "created": "YYYY-MM-DDTHH:MM:SS.msZ"
}
```

```
GET /api/v1/posts/{post_id}/comments/{comment_id}/
```

Response:

```json
{
    "id": 1,
    "author": "author",
    "post": 1,
    "text": "Hello, friend",
    "created": "YYYY-MM-DDTHH:MM:SS.msZ"
}
```

```
PATCH /api/v1/posts/{post_id}/comments/{comment_id}/
```

Payload:

```json
{
    "text": "Hello, friend"
}
```

Response:

```json
{
    "id": 2,
    "author": "author",
    "post": 1,
    "text": "Hello, friend",
    "created": "YYYY-MM-DDTHH:MM:SS.msZ"
}
```

```
DELETE /api/v1/posts/{post_id}/comments/{comment_id}/
```

Basic errors:
* 401 Unauthorized ```Недопустимый токен.```
* 403 Forbidden ```Изменения авторского контента запрещены.```
* 404 Not Found ```Ресурс не найден.```