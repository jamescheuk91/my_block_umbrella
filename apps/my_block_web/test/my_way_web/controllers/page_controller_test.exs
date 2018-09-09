defmodule MyBlockWeb.PageControllerTest do
  use MyBlockWeb.ConnCase

  @moduletag :controller_test

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix MyBlockWeb!"
  end
end
