# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :designopencode,
  ecto_repos: [Designopencode.Repo]

# Configures the endpoint
config :designopencode, DesignopencodeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vJV8iE/YnnhXOS0V9/nsJAZJRE+Uz4tEGaAJS0ixXA4lE/ZL75IARtKFso7f+N4m",
  render_errors: [view: DesignopencodeWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Designopencode.PubSub,
  live_view: [signing_salt: "Ebwwsr43"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
