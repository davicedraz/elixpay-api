defmodule ElixpayWeb.FallbackController do
  use ElixpayWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ElixpayWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
