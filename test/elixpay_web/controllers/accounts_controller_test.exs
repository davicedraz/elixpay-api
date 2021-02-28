defmodule ElixpayWeb.AccountsControllerTest do
  use ElixpayWeb.ConnCase
  alias Elixpay.{Account, User}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "Davi Cedraz",
        password: "123456",
        username: "davicedraz",
        email: "davioler@gmail.com",
        age: 24
      }

      conn = put_req_header(conn, "authorization", "Basic #{Base.encode64("admin:passwd")}")
      {:ok, %User{account: %Account{id: account_id}}} = Elixpay.create_user(params)
      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, execute a deposit", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:ok)

      assert %{
               "account" => %{
                 "balance" => "50.00",
                 "id" => _id
               },
               "message" => "Balance succesfully updated"
             } = response
    end
  end
end
