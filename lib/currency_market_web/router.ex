defmodule CurrencyMarketWeb.Router do
  use CurrencyMarketWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {CurrencyMarketWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CurrencyMarketWeb do
    pipe_through :browser

    get "/", PageController, :home

    get "/values", ValueController, :index
    get "/values/new", ValueController, :new
    get "/values/:id", ValueController, :show
    get "/values/:id/edit", ValueController, :edit
    post "/values", ValueController, :create
    put "/values/:id", ValueController, :update
    delete "/values/:id", ValueController, :delete


    get "/currencies", CurrencyController, :index
    get "/currencies/new", CurrencyController, :new
    get "/currencies/:id", CurrencyController, :show
    get "/currencies/:id/edit", CurrencyController, :edit
    post "/currencies", CurrencyController, :create
    put "/currencies/:id", CurrencyController, :update
    delete "/currencies/:id", CurrencyController, :delete


  end

  # Other scopes may use custom stacks.
  # scope "/api", CurrencyMarketWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:currency_market, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: CurrencyMarketWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
