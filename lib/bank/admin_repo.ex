defmodule Bank.AdminRepo do
  @moduledoc """
  Admin repository
  """
  alias Bank.{Repo, User}

  def get_user_by_id!(id) do
    Repo.get!(User, id)
  end
end
