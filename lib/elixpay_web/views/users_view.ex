defmodule ElixpayWeb.UsersView do
  alias Elixpay.User

  def render("created_user.json", %{user: %User{id: id, name: name, username: username}}) do
    %{
      message: "User created",
      user: %{
        id: id,
        name: name,
        username: username
      }
    }
  end
end
