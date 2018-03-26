defmodule TemptestWeb.TemperatureController do
  use TemptestWeb, :controller

  def index(conn, _params) do
    render conn, "temperature.html"
  end
end
