defmodule ElixpayWeb.Router do
  use ElixpayWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ElixpayWeb do
    pipe_through :api
    post "/users", UsersController, :create
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: ElixpayWeb.Telemetry
    end
  end
end
