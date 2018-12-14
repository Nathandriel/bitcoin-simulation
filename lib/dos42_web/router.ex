defmodule Dos42Web.Router do
  use Dos42Web, :router

  pipeline :browser do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["html"]
  end

  scope "/", Dos42Web do
    pipe_through :browser

    get "/", PageController, :index

    get "/simulate", SimulationController, :index

    
  end

  # Other scopes may use custom stacks.
  # scope "/api", Dos42Web do
  #   pipe_through :api
  # end
end
