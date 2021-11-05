# springboot-helloworld

Simple app made of Kotlin and Spring Boot

## API Request Examples

Simply:

```shell
$ http localhost:8080/hello

HTTP/1.1 200
Connection: keep-alive
Content-Type: application/json
Date: Fri, 05 Nov 2021 09:08:07 GMT
Keep-Alive: timeout=60
Transfer-Encoding: chunked

{
    "data": "Hello, world"
}
```

or, with `user` query param:

```shell
$ http "http://localhost:8080/hello?user=Philip"

HTTP/1.1 200
Connection: keep-alive
Content-Type: application/json
Date: Fri, 05 Nov 2021 09:08:04 GMT
Keep-Alive: timeout=60
Transfer-Encoding: chunked

{
    "data": "Hello, Philip"
}
```
