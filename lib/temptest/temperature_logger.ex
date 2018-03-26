defmodule TemperatureLogger do
  use GenMQTT

  require Logger

  def start_link do
    GenMQTT.start_link(__MODULE__, nil, [{:name, __MODULE__}, {:host, "31.13.251.15"}, {:port, 8883}, {:username, "sensornet"}, {:password, "aemos"}])
  end

  def on_connect(state) do
    :ok = GenMQTT.subscribe(self(), "TempVarna", 2)
    Logger.info("MQTT connection established!")
    {:ok, state}
  end

  def on_publish(["TempVarna"], message, state) do
    Logger.debug("MQTT server published!")
    Logger.info("The temperature is #{message} degrees.")
    broadcast(message)
    {:ok, state}
  end

  def broadcast(message) do
    TemptestWeb.Endpoint.broadcast("temp: publish", "new_message", %{message: message})
  end

end
