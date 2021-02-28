defmodule ElixpayWeb.Router do
  use ElixpayWeb, :router
  import Plug.BasicAuth

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug :basic_auth, Application.compile_env(:elixpay, :basic_auth)
  end

  scope "/api", ElixpayWeb do
    pipe_through :api
    post "/users", UsersController, :create
  end

  scope "/api", ElixpayWeb do
    pipe_through [:api, :auth]

    post "/accounts/:id/deposit", AccountsController, :deposit
    post "/accounts/:id/withdraw", AccountsController, :withdraw
    post "/accounts/transaction", AccountsController, :transaction
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: ElixpayWeb.Telemetry
    end
  end
end
