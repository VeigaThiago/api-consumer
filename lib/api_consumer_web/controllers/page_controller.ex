defmodule ApiConsumerWeb.PageController do
  use ApiConsumerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
