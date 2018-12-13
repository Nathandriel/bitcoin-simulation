defmodule Dos42.Repo do
  use Ecto.Repo,
    otp_app: :dos42,
    adapter: Ecto.Adapters.Postgres
end
