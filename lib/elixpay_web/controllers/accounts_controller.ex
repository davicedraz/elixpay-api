defmodule ElixpayWeb.AccountsController do
  use ElixpayWeb, :controller
  alias Elixpay.Account
  alias Elixpay.Accounts.Transactions.Response, as: TransactionResponse

  action_fallback ElixpayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Elixpay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- Elixpay.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def transaction(conn, params) do
    with {:ok, %TransactionResponse{} = transaction} <- Elixpay.transaction(params) do
      conn
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end
  end

end
