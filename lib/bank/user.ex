defmodule Bank.User do
  @moduledoc """
    User schema
  """

  use Ecto.Schema

  schema "users" do
    field :email, :string, null: false
    field :isAdmin, :boolean, default: false
    field :name, :string, null: false
    field :password, :string, virtual: true
    field :password_hash, :string, null: false

    timestamps()
  end
end
