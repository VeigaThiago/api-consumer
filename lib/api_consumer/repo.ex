defmodule ApiConsumer.Repo do
  use Ecto.Repo,
    otp_app: :api_consumer,
    adapter: Ecto.Adapters.Postgres
end
