defmodule Elixpay do
  alias Elixpay.Users.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call
end
