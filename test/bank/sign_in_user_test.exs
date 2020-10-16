defmodule Bank.SignInUserTest do
  use Bank.DataCase, async: true

  import Bank.Factory

  alias Bank.{SignInUser, User}

  describe "run/2" do
    test "return user when email and password match" do
      user = insert(:user)
      assert {:ok, %User{}} = SignInUser.run(user.email, "123456")
    end

    test "return error when email does not exist" do
      assert {:error, :email_or_password_invalid} =
               SignInUser.run("inexistent@example.com", "123456")
    end

    test "return error when password is invalid" do
      user = insert(:user)
      assert {:error, :email_or_password_invalid} = SignInUser.run(user.email, "1234")
    end
  end
end
