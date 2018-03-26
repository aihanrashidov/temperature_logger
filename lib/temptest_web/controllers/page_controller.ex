defmodule TemptestWeb.PageController do
  use TemptestWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
