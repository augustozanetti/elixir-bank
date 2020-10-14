defmodule BankWeb.SessionController do
  use BankWeb, :controller

  alias Bank.SignInUser

  def create(conn, %{"email" => email, "password" => password}) do
    case SignInUser.run(email, password) do
      {:ok, user} ->
        render(conn, "session.json", %{user: user})

      {:error, _} ->
        conn
        |> put_status(401)
        |> json(%{status: "unauthenticated"})
    end
  end
end
