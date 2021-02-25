defmodule ElixpayWeb.AccountsController do
  use ElixpayWeb, :controller
  alias Elixpay.Account

  action_fallback ElixpayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Elixpay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update_account.json", account: account)
    end
  end
end
