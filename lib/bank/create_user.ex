defmodule Bank.CreateUser do
  @moduledoc """
   Creating a new User
  """

  import Ecto.Changeset

  alias Bank.{Repo, User}

  @doc false
  def run(attrs) do
    %User{}
    |> cast(attrs, [:name, :email, :password])
    |> validate_required([:name, :email, :password])
    |> validate_length(:password, min: 6)
    |> unique_constraint(:email)
    |> put_password()
    |> Repo.insert()
  end

  defp put_password(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    put_change(changeset, :password_hash, Bcrypt.hash_pwd_salt(password))
  end

  defp put_password(changeset), do: changeset
end
