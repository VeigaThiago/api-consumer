use Mix.Config

# Configure your database
config :api_consumer, ApiConsumer.Repo,
  username: "postgres",
  password: "postgres",
  database: "api_consumer_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :api_consumer, ApiConsumerWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
