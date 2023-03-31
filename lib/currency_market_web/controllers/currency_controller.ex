defmodule CurrencyMarketWeb.CurrencyController do
  use CurrencyMarketWeb, :controller

  alias CurrencyMarket.CurrenciesContext
  alias CurrencyMarket.CurrenciesContext.Currency

  def index(conn, _params) do
    currencies = CurrenciesContext.list_currencies()
    render(conn, :index, currencies: currencies)
  end

  def new(conn, _params) do
    changeset = CurrenciesContext.change_currency(%Currency{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"currency" => currency_params}) do
    case CurrenciesContext.create_currency(currency_params) do
      {:ok, currency} ->
        conn
        |> put_flash(:info, "Currency created successfully.")
        |> redirect(to: ~p"/currencies/#{currency}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    currency = CurrenciesContext.get_values_for_currency!(id)
    render(conn, :show, currency: currency)
  end

  def edit(conn, %{"id" => id}) do
    currency = CurrenciesContext.get_currency!(id)
    changeset = CurrenciesContext.change_currency(currency)
    render(conn, :edit, currency: currency, changeset: changeset)
  end

  def update(conn, %{"id" => id, "currency" => currency_params}) do
    currency = CurrenciesContext.get_currency!(id)

    case CurrenciesContext.update_currency(currency, currency_params) do
      {:ok, currency} ->
        conn
        |> put_flash(:info, "Currency updated successfully.")
        |> redirect(to: ~p"/currencies/#{currency}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, currency: currency, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    currency = CurrenciesContext.get_currency!(id)
    {:ok, _currency} = CurrenciesContext.delete_currency(currency)

    conn
    |> put_flash(:info, "Currency deleted successfully.")
    |> redirect(to: ~p"/currencies")
  end
end
