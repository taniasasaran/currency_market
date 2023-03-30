defmodule CurrencyMarket.ValuesContext.Value do
  use Ecto.Schema
  import Ecto.Changeset
  alias CurrencyMarket.CurrenciesContext.Currency

  schema "values" do
    field :record_date, :date
    field :record_value, :float
    belongs_to :currency, Currency

    timestamps()
  end

  @doc false
  def changeset(value, attrs) do
    value
    |> cast(attrs, [:currency_id, :record_date, :record_value])
    |> validate_required([:currency_id, :record_date, :record_value])
  end
end
