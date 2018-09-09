defmodule MyBlockAdminWeb.PageControllerTest do
  use MyBlockAdminWeb.ConnCase

  @moduletag :controller_test

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix MyBlockAdminWeb!"
  end
end
