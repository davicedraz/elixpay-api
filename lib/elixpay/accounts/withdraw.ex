defmodule Elixpay.Accounts.Withdraw do
  alias Elixpay.Accounts.Operation
  alias Elixpay.Repo

  def call(params) do
   params
    |> Operation.call(:withdraw)
    |> run_transaction()
  end

  defp run_transaction(multi) do
    case Repo.transaction(multi) do
      {:error, _operation, reason, _changes} -> {:error, reason}
      {:ok, %{account_withdraw: account}} -> {:ok, account}
    end
  end
end
