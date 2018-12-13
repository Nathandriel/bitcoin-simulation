# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :dos42,
  ecto_repos: [Dos42.Repo]

# Configures the endpoint
config :dos42, Dos42Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0lx4nka4cQBU7fbutp6TuUQeXHJKr9XzLjElFBC3FdpAJZQGp4TjqX66LM9IfVw3",
  render_errors: [view: Dos42Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Dos42.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
