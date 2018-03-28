defmodule TemperatureLogger do
  use GenMQTT

  require Logger

  def start_link do
    options =
      [
        Application.get_env(:temptest, :host),
        Application.get_env(:temptest, :port),
        Application.get_env(:temptest, :username),
        Application.get_env(:temptest, :password)
      ]
    GenMQTT.start_link(__MODULE__, nil, options)
  end

  def on_connect(state) do
    topic = Application.get_env(:temptest, :topic)
    qos = Application.get_env(:temptest, :qos)

    :ok = GenMQTT.subscribe(self(), topic, qos)

    Logger.info("MQTT connection established!")
    {:ok, state}
  end

  def on_publish([_], message, state) do
    Logger.debug("MQTT server published!")
    Logger.info("#{message}")
    broadcast(message)
    {:ok, state}
  end

  def broadcast(message) do
    TemptestWeb.Endpoint.broadcast("temp: publish", "new_message", %{message: message})
  end

end
