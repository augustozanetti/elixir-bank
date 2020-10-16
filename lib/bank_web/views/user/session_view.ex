defmodule BankWeb.SessionView do
  use BankWeb, :view

  def render("session.json", %{user: user, token: token}) do
    %{
      status: "ok",
      data: %{
        name: user.name,
        email: user.email,
        token: token
      }
    }
  end
end
