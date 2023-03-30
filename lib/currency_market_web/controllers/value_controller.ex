defmodule CurrencyMarketWeb.ValueController do
  use CurrencyMarketWeb, :controller

  alias CurrencyMarket.ValuesContext
  alias CurrencyMarket.ValuesContext.Value

  def index(conn, _params) do
    values = ValuesContext.list_values()
    render(conn, :index, values: values)
  end

  def new(conn, _params) do
    changeset = ValuesContext.change_value(%Value{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"value" => value_params}) do
    case ValuesContext.create_value(value_params) do
      {:ok, value} ->
        conn
        |> put_flash(:info, "Value created successfully.")
        |> redirect(to: ~p"/values/#{value}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    value = ValuesContext.get_value!(id)
    render(conn, :show, value: value)
  end

  def edit(conn, %{"id" => id}) do
    value = ValuesContext.get_value!(id)
    changeset = ValuesContext.change_value(value)
    render(conn, :edit, value: value, changeset: changeset)
  end

  def update(conn, %{"id" => id, "value" => value_params}) do
    value = ValuesContext.get_value!(id)

    case ValuesContext.update_value(value, value_params) do
      {:ok, value} ->
        conn
        |> put_flash(:info, "Value updated successfully.")
        |> redirect(to: ~p"/values/#{value}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, value: value, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    value = ValuesContext.get_value!(id)
    {:ok, _value} = ValuesContext.delete_value(value)

    conn
    |> put_flash(:info, "Value deleted successfully.")
    |> redirect(to: ~p"/values")
  end
end
