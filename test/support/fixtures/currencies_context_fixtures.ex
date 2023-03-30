defmodule CurrencyMarket.CurrenciesContextFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CurrencyMarket.CurrenciesContext` context.
  """

  @doc """
  Generate a currency.
  """
  def currency_fixture(attrs \\ %{}) do
    {:ok, currency} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> CurrencyMarket.CurrenciesContext.create_currency()

    currency
  end
end
