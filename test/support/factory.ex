defmodule Bank.Factory do
  use ExMachina.Ecto, repo: Bank.Repo

  @moduledoc false

  alias Bank.User

  def user_factory do
    %User{
      name: "Jane Smith",
      email: sequence(:email, &"user#{&1}@email.com"),
      password_hash: Bcrypt.hash_pwd_salt("123456")
    }
  end
end
