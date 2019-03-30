defmodule MyBlockAdminWeb.Router do
  use MyBlockAdminWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", MyBlockAdminWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", DashboardController, :index)
    get("/dashboard", DashboardController, :index)
    get("/page", PageController, :index)
    get("/fullnodes", FullNodeController, :index)
    get("/fullnodes/:fullnode_id", FullNodeController, :show)
  end

  # Other scopes may use custom stacks.
  # scope "/api", MyBlockAdminWeb do
  #   pipe_through :api
  # end
end
