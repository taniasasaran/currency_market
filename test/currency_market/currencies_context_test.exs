defmodule CurrencyMarket.CurrenciesContextTest do
  use CurrencyMarket.DataCase

  alias CurrencyMarket.CurrenciesContext

  describe "currencies" do
    alias CurrencyMarket.CurrenciesContext.Currency

    import CurrencyMarket.CurrenciesContextFixtures

    @invalid_attrs %{description: nil, name: nil}

    test "list_currencies/0 returns all currencies" do
      currency = currency_fixture()
      assert CurrenciesContext.list_currencies() == [currency]
    end

    test "get_currency!/1 returns the currency with given id" do
      currency = currency_fixture()
      assert CurrenciesContext.get_currency!(currency.id) == currency
    end

    test "create_currency/1 with valid data creates a currency" do
      valid_attrs = %{description: "some description", name: "some name"}

      assert {:ok, %Currency{} = currency} = CurrenciesContext.create_currency(valid_attrs)
      assert currency.description == "some description"
      assert currency.name == "some name"
    end

    test "create_currency/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CurrenciesContext.create_currency(@invalid_attrs)
    end

    test "update_currency/2 with valid data updates the currency" do
      currency = currency_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name"}

      assert {:ok, %Currency{} = currency} = CurrenciesContext.update_currency(currency, update_attrs)
      assert currency.description == "some updated description"
      assert currency.name == "some updated name"
    end

    test "update_currency/2 with invalid data returns error changeset" do
      currency = currency_fixture()
      assert {:error, %Ecto.Changeset{}} = CurrenciesContext.update_currency(currency, @invalid_attrs)
      assert currency == CurrenciesContext.get_currency!(currency.id)
    end

    test "delete_currency/1 deletes the currency" do
      currency = currency_fixture()
      assert {:ok, %Currency{}} = CurrenciesContext.delete_currency(currency)
      assert_raise Ecto.NoResultsError, fn -> CurrenciesContext.get_currency!(currency.id) end
    end

    test "change_currency/1 returns a currency changeset" do
      currency = currency_fixture()
      assert %Ecto.Changeset{} = CurrenciesContext.change_currency(currency)
    end
  end
end
