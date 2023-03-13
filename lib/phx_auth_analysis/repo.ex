defmodule PhxAuthAnalysis.Repo do
  use Ecto.Repo,
    otp_app: :phx_auth_analysis,
    adapter: Ecto.Adapters.Postgres
end
