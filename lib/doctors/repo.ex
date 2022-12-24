defmodule Doctors.Repo do
  use Ecto.Repo,
    otp_app: :doctors,
    adapter: Ecto.Adapters.Postgres
end
