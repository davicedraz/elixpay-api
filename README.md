# Elixpay

Playing around with Elixir. Based on [Rafael Camarda](https://github.com/RafaelCamarda) training. 

## Run

You gonna need a postgres database:
```
$ docker run --name postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres
```
Start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser:

* POST - /api/users
```JSON
{
    "name": "Davi Cedraz",
    "email": "davioler@gmail.com",
    "username": "davicedraz",
    "age": 24,
    "password": "123456"
}
```

* POST - /api/accounts/transaction
  * Basic Auth: (admin:passwd)
```JSON
{
    "from": "a6516cc6-904a-4f7c-bd0b-c06e1498a5d0",
    "to": "4f3361fd-f152-47fb-9345-c1a7432ee50b",
    "value": "50.00"
}
```

____

## Test
Execute: 
```
mix test --cover
``` 
or
```
$ mix coveralls.html
```

## About

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/p
  * Source: https://github.com/phoenixframework/phoenix
