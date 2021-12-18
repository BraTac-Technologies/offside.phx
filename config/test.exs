import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :offside_phx, OffsidePhx.Repo,
  username: "postgres",
  password: "postgres",
  database: "offside_phx_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :offside_phx, OffsidePhxWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "ndRGWru+bHHoqyxznPF10nmH98fvj3EMI7NbVqbGqLQ6YTv/39gdOJ7acEgoi+vj",
  server: false

# In test we don't send emails.
config :offside_phx, OffsidePhx.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
