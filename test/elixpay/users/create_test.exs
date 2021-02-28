defmodule Elixpay.Users.CreateTest do
  use Elixpay.DataCase

  alias Elixpay.User
  alias Elixpay.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "Davi Cedraz",
        password: "123456",
        username: "davicedraz",
        email: "davioler@gmail.com",
        age: 24
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Davi Cedraz", age: 24, id: ^user_id} = user
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Davi Cedraz",
        username: "davicedraz",
        email: "invalid.email",
        age: 24
      }

      {:error, changeset} = Create.call(params)
      expected_response = %{email: ["has invalid format"], password: ["can't be blank"]}
      assert errors_on(changeset) == expected_response
    end
  end
end
