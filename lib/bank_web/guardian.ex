defmodule BankWeb.Guardian do
  @moduledoc """
  JWT Authentication
  """
  use Guardian, otp_app: :bank

  def subject_for_token(resource, _claims) do
    sub = to_string(resource.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = Bank.AdminRepo.get_user_by_id!(id)
    {:ok, resource}
  end
end
