defmodule CurrencyMarket.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      CurrencyMarketWeb.Telemetry,
      # Start the Ecto repository
      CurrencyMarket.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: CurrencyMarket.PubSub},
      # Start Finch
      {Finch, name: CurrencyMarket.Finch},
      # Start the Endpoint (http/https)
      CurrencyMarketWeb.Endpoint
      # Start a worker by calling: CurrencyMarket.Worker.start_link(arg)
      # {CurrencyMarket.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CurrencyMarket.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CurrencyMarketWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
