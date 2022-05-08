defmodule ElibraryWeb.PageController do
  use ElibraryWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
