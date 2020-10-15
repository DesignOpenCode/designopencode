defmodule DesignopencodeWeb.Router do
  use DesignopencodeWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug DesignopencodeWeb.Auth, repo: Designopencode.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DesignopencodeWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/auth", DesignopencodeWeb do
    pipe_through(:browser)

    get("/:provider", AuthController, :index)
    get("/:provider/callback", AuthController, :callback)
    delete("/logout", AuthController, :delete)
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: DesignopencodeWeb.Telemetry
    end
  end
end
