defmodule CurrencyMarket.ValuesContextTest do
  use CurrencyMarket.DataCase

  alias CurrencyMarket.ValuesContext

  describe "values" do
    alias CurrencyMarket.ValuesContext.Value

    import CurrencyMarket.ValuesContextFixtures

    @invalid_attrs %{record_date: nil, record_value: nil}

    test "list_values/0 returns all values" do
      value = value_fixture()
      assert ValuesContext.list_values() == [value]
    end

    test "get_value!/1 returns the value with given id" do
      value = value_fixture()
      assert ValuesContext.get_value!(value.id) == value
    end

    test "create_value/1 with valid data creates a value" do
      valid_attrs = %{record_date: ~D[2023-03-27], record_value: 120.5}

      assert {:ok, %Value{} = value} = ValuesContext.create_value(valid_attrs)
      assert value.record_date == ~D[2023-03-27]
      assert value.record_value == 120.5
    end

    test "create_value/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ValuesContext.create_value(@invalid_attrs)
    end

    test "update_value/2 with valid data updates the value" do
      value = value_fixture()
      update_attrs = %{record_date: ~D[2023-03-28], record_value: 456.7}

      assert {:ok, %Value{} = value} = ValuesContext.update_value(value, update_attrs)
      assert value.record_date == ~D[2023-03-28]
      assert value.record_value == 456.7
    end

    test "update_value/2 with invalid data returns error changeset" do
      value = value_fixture()
      assert {:error, %Ecto.Changeset{}} = ValuesContext.update_value(value, @invalid_attrs)
      assert value == ValuesContext.get_value!(value.id)
    end

    test "delete_value/1 deletes the value" do
      value = value_fixture()
      assert {:ok, %Value{}} = ValuesContext.delete_value(value)
      assert_raise Ecto.NoResultsError, fn -> ValuesContext.get_value!(value.id) end
    end

    test "change_value/1 returns a value changeset" do
      value = value_fixture()
      assert %Ecto.Changeset{} = ValuesContext.change_value(value)
    end
  end

  describe "values" do
    alias CurrencyMarket.ValuesContext.Value

    import CurrencyMarket.ValuesContextFixtures

    @invalid_attrs %{record_date: nil, record_value: nil}

    test "list_values/0 returns all values" do
      value = value_fixture()
      assert ValuesContext.list_values() == [value]
    end

    test "get_value!/1 returns the value with given id" do
      value = value_fixture()
      assert ValuesContext.get_value!(value.id) == value
    end

    test "create_value/1 with valid data creates a value" do
      valid_attrs = %{record_date: ~D[2023-03-28], record_value: 120.5}

      assert {:ok, %Value{} = value} = ValuesContext.create_value(valid_attrs)
      assert value.record_date == ~D[2023-03-28]
      assert value.record_value == 120.5
    end

    test "create_value/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ValuesContext.create_value(@invalid_attrs)
    end

    test "update_value/2 with valid data updates the value" do
      value = value_fixture()
      update_attrs = %{record_date: ~D[2023-03-29], record_value: 456.7}

      assert {:ok, %Value{} = value} = ValuesContext.update_value(value, update_attrs)
      assert value.record_date == ~D[2023-03-29]
      assert value.record_value == 456.7
    end

    test "update_value/2 with invalid data returns error changeset" do
      value = value_fixture()
      assert {:error, %Ecto.Changeset{}} = ValuesContext.update_value(value, @invalid_attrs)
      assert value == ValuesContext.get_value!(value.id)
    end

    test "delete_value/1 deletes the value" do
      value = value_fixture()
      assert {:ok, %Value{}} = ValuesContext.delete_value(value)
      assert_raise Ecto.NoResultsError, fn -> ValuesContext.get_value!(value.id) end
    end

    test "change_value/1 returns a value changeset" do
      value = value_fixture()
      assert %Ecto.Changeset{} = ValuesContext.change_value(value)
    end
  end
end
