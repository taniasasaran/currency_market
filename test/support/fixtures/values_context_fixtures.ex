defmodule CurrencyMarket.ValuesContextFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CurrencyMarket.ValuesContext` context.
  """

  @doc """
  Generate a value.
  """
  def value_fixture(attrs \\ %{}) do
    {:ok, value} =
      attrs
      |> Enum.into(%{
        record_date: ~D[2023-03-27],
        record_value: 120.5
      })
      |> CurrencyMarket.ValuesContext.create_value()

    value
  end
end
