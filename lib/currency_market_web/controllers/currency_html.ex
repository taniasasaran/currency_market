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
    |> Enum.map(fn {a, b} -> a - b end)
  end

  def variation_percent(currency) do
    currency
    |> variation()
    |> Enum.map(fn value -> value/100.0 end)
  end
end
