defmodule Bank.User do
  @moduledoc """
    User schema
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string, null: false
    field :isAdmin, :boolean, default: false
    field :name, :string, null: false
    field :password, :string, virtual: true
    field :password_hash, :string, null: false

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password_hash])
    |> validate_required([:name, :email, :password_hash])
  end
end
