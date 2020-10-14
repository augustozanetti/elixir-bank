defmodule BankWeb.SessionView do
  use BankWeb, :view

  def render("session.json", %{user: user}) do
    %{
      status: "ok",
      data: %{
        name: user.name,
        email: user.email
      }
    }
  end
end
