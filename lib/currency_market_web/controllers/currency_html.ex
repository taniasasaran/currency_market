defmodule CurrencyMarketWeb.CurrencyHTML do
  use CurrencyMarketWeb, :html

  embed_templates "currency_html/*"

  @doc """
  Renders a currency form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def currency_form(assigns)

  def variation(currency) do
    values = currency.values
    |> Enum.map(fn value -> value.record_value end)
    [_ | next] = values
    values
    |> Enum.zip(next)
    |> Enum.map(fn {a, b} -> Float.round(a - b, 4) end)
    |> List.insert_at(0, 0/1)
  end

  def variation2(value1, value2) do
    value2.record_value - value1.record_value
  end

  def variation_percent(currency) do
    currency
    |> variation()
    |> Enum.map(fn value -> Float.to_string(value*100) <> "%"  end)
    # |> Enum.map(fn value -> value)
  end
end
