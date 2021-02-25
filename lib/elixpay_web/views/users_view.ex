defmodule ElixpayWeb.UsersView do
  alias Elixpay.{Account, User}

  def render("created_user.json", %{
        user: %User{
          account: %Account{
            id: account_id,
            balance: balance
          },
          id: id,
          name: name,
          username: username
        }
      }) do
    %{
      message: "User created",
      user: %{
        id: id,
        name: name,
        username: username,
        account: %{
          id: account_id,
          balance: balance
        }
      }
    }
  end
end
