defmodule ElixpayWeb.UsersController do
  use ElixpayWeb, :controller
  alias Elixpay.User

  def create(conn, params) do
    params
    |> Elixpay.create_user()
    |> handle_insert_and_send_response(conn)
  end

  defp handle_insert_and_send_response({:ok, %User{} = user}, conn) do
    conn
    |> put_status(:created)
    |> render("created_user.json", user: user)
  end

    defp handle_insert_and_send_response({:error, result}, conn) do
    conn
    |> put_status(:bad_request)
    |> put_view(ElixpayView.ErrorView)
    |> render("400.json", result: result)
  end
end
