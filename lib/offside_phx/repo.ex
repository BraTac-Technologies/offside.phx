defmodule OffsidePhx.Repo do
  use Ecto.Repo,
    otp_app: :offside_phx,
    adapter: Ecto.Adapters.Postgres
end
