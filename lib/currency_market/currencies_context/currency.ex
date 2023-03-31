defmodule CurrencyMarket.CurrenciesContext.Currency do
  use Ecto.Schema
  import Ecto.Changeset
  alias CurrencyMarket.ValuesContext.Value

  schema "currencies" do
    field :description, :string
    field :name, :string
    has_many :values, Value

    timestamps()
  end

  @doc false
  def changeset(currency, attrs) do
    currency
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
