defmodule ElixpayWeb.AccountsView do
  alias Elixpay.Account
  alias Elixpay.Accounts.Transactions.Response, as: TransactionResponse

  def render("update.json", %{accounts: %Account{id: account_id, balance: balance}}) do
    %{
      message: "Balance succesfully updated",
      user: %{
        id: account_id,
        balance: balance
      }
    }
  end

  def render("transaction.json", %{
        transaction: %TransactionResponse{to_account: to_account, from_account: from_account}
      }) do
    %{
      message: "Transaction succesfully done",
      transaction: %{
        from_account: %{
          id: from_account.id,
          balance: from_account.balance
        },
        to_account: %{
          id: to_account.id,
          balance: to_account.balance
        }
      }
    }
  end
end
