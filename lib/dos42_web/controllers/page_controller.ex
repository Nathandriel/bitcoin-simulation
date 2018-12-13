defmodule Dos42Web.PageController do
  use Dos42Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
