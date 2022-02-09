defmodule ComsumeDepsWeb.PageController do
  use ComsumeDepsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
