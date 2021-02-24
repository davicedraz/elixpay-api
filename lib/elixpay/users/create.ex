defmodule Elixpay.Users.Create do
  alias Elixpay.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
