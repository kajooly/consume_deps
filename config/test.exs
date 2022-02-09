import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :comsume_deps, ComsumeDeps.Repo,
username: System.get_env("PSQL_USERNAME"),
password: System.get_env("PSQL_PASSWORD"),
database: System.get_env("PSQL_DATABASE"),
hostname: System.get_env("PSQL_HOSTNAME"),
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :comsume_deps, ComsumeDepsWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "LiEoLk55gUsr5Mx7noN03CxbKUCSjrkMyotR0aCqCf/mHsf9HXtoStAeyAF9icK4",
  server: false

# In test we don't send emails.
config :comsume_deps, ComsumeDeps.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
