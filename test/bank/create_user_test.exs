defmodule Bank.CreateUserTest do
  use Bank.DataCase

  alias Bank.{CreateUser, User}

  describe "run/1" do
    test "returns a struct whern the params are valid" do
      params = %{name: "first name", email: "first@gmail.com", password: "123456"}
      assert {:ok, %User{} = user} = CreateUser.run(params)
      assert user.name == params.name
      assert user.email == params.email
    end

    @tag :skip
    test "returns error when email is duplicated" do
      params = %{name: "first name", email: "first@gmail.com", password: "123456"}
      assert {:error, %Ecto.Changeset{} = changeset} = CreateUser.run(params)
      %{email: ["has already been taken"]} = errors_on(changeset)
    end

    test "returns error when name is missing" do
      params = %{name: "", email: "first@gmail.com", password: "123456"}
      assert {:error, %Ecto.Changeset{} = changeset} = CreateUser.run(params)
      %{name: ["can't be blank"]} = errors_on(changeset)
    end

    test "returns error when email is missing" do
      params = %{name: "first name", email: "", password: "123456"}
      assert {:error, changeset} = CreateUser.run(params)
      %{email: ["can't be blank"]} = errors_on(changeset)
    end

    test "returns error when password is missing" do
      params = %{name: "first name", email: "first@gmail.com", password: ""}
      assert {:error, changeset} = CreateUser.run(params)
      %{password: ["can't be blank"]} = errors_on(changeset)
    end

    test "returns error when password is invalid length" do
      params = %{name: "first name", email: "first@gmail.com", password: "12345"}
      assert {:error, changeset} = CreateUser.run(params)
      %{password: ["should be at least 6 character(s)"]} = errors_on(changeset)
    end
  end
end
