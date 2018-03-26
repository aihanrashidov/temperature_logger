defmodule TemptestWeb.TemperatureChannel do
  use TemptestWeb, :channel

  def join("temp: publish", msg, socket) do
    {:ok, socket}
  end

  def handle_in("new_message", msg, socket) do
    push socket, "new_message", msg
    {:noreply, socket}
  end

end
