defmodule Elixpay do
  alias Elixpay.Users.Create, as: UserCreate

  alias Elixpay.Account.Deposit

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate deposit(params), to: Deposit, as: :call
end
