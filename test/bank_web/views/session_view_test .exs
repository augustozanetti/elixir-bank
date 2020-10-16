defmodule BankWeb.SessionViewTest do
  use ExUnit.Case, async: true

  alias BankWeb.SessionView

  import Bank.Factory

  test "render/2 return ok and user data" do
    user = params_for(:user)

    assert %{status: "ok", data: %{name: user.name, email: user.email, token: "token"}} =
             render("session.json", %{user: user, token: "token"})
  end
end
