# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :movie_game,
  ecto_repos: [MovieGame.Repo]

# Configures the endpoint
config :movie_game, MovieGameWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "biEHdOj5anmTVf2gDE9+9zuYhuRP7KbHfIdZHIzAh6KorysReUZ+SbxM3hL9zQwJ",
  render_errors: [view: MovieGameWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: MovieGame.PubSub,
  live_view: [signing_salt: "TSzhBHg6"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
