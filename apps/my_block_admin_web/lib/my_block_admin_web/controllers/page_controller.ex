defmodule MyBlockAdminWeb.PageController do
  use MyBlockAdminWeb, :controller

  def index(conn, _params) do
    conn
    |> render("index.html", welcome_text: "Welcome to MyBlockAdminWeb!")
  end
end
