defmodule CurrencyMarket.Repo do
  use Ecto.Repo,
    otp_app: :currency_market,
    adapter: Ecto.Adapters.Postgres
end
