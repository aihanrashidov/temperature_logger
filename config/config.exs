# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :temptest,
  ecto_repos: [Temptest.Repo],
  host: {:host, "31.13.251.15"},
  port: {:port, 8883},
  username: {:username, "sensornet"},
  password: {:password, "aemos"},
  topic: "TempVarna",
  qos: 2

# Configures the endpoint
config :temptest, TemptestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "t3dK1PjKqdntsbeN8cKUlGP2bBMwyMfCA8O2NV850vtbomSDszuxblDRbYnr/jIz",
  render_errors: [view: TemptestWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Temptest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
