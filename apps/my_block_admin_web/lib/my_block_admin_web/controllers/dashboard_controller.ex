defmodule MyBlockAdminWeb.DashboardController do
  use MyBlockAdminWeb, :controller

  def index(conn, _params) do
    conn
    |> render("index.html")
  end

end
