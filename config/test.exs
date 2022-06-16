import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :elibrary, Elibrary.Repo,
  # username: "svetlana",
  username: "postgres",
  # password: "55155166778I",
  password: "postgres",
  hostname: "localhost",
  database: "elibrary_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :elibrary, ElibraryWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "QtKpOvW1BLyJD/HmBri/mMNgT2nSucVbzIBOPjMKSI4W27lEIeC3vdkNrQ5SA8n3",
  server: false

# In test we don't send emails.
config :elibrary, Elibrary.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :elibrary, Elibrary.Accounts.Services.Guardian,
  secret_key: "HxdiegBPdfAM4StbEYdtcT7B2k/n/+eux1D6172e/eEdLBepO7QVTM76FFtGTKrp"
