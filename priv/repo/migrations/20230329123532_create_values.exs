defmodule CurrencyMarket.Repo.Migrations.CreateValues do
  use Ecto.Migration

  def change do
    create table(:values) do
      add :record_date, :date
      add :record_value, :float
      add :currency_id, references(:currencies, on_delete: :delete_all)

      timestamps()
    end

    create index(:values, [:currency_id])
  end
end
