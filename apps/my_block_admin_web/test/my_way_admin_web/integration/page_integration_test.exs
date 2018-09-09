defmodule MyBlockAdminWeb.PageIntegrationTest do
  use MyBlockAdminWeb.IntegrationCase, async: true

  @moduletag :integration_test

  test "basic root index page flow", %{conn: conn} do
    # get the root index page
    conn
    |> get(page_path(conn, :index))
    # click/follow through the various about pages
    # |> follow_link( "About Us" )
    # |> follow_link( "Contact" )
    # |> follow_link( "Privacy" )
    # |> follow_link( "Terms of Service" )
    # |> follow_link( "Home" )
    |> assert_response(status: 200, path: page_path(conn, :index))
  end
end
