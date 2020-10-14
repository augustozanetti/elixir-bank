defmodule BankWeb.SessionControllerTest do
  use BankWeb.ConnCase, async: true

  import Bank.Factory

  describe "create/2" do
    setup %{conn: conn} do
      insert(:user, name: "signin", email: "signin@gmail.com")
      %{conn: conn}
    end

    test "returns 200 when user credentials are valid", %{conn: conn} do
      conn =
        post(conn, "/api/v1/signin", %{"email" => "signin@gmail.com", "password" => "123456"})

      assert %{"status" => "ok", "data" => %{"name" => "signin"}} = json_response(conn, 200)
    end

    test "returns 401 when user email is inexistent", %{conn: conn} do
      conn =
        post(conn, "/api/v1/signin", %{"email" => "inexistent@gmail.com", "password" => "123456"})

      assert %{"status" => "unauthenticated"} = json_response(conn, 401)
    end

    test "returns 401 when user password is invalid", %{conn: conn} do
      conn =
        post(conn, "/api/v1/signin", %{"email" => "signin@gmail.com", "password" => "1234565"})

      assert %{"status" => "unauthenticated"} = json_response(conn, 401)
    end
  end
end
