defmodule ComsumeDeps.Repo do
  use Ecto.Repo,
    otp_app: :comsume_deps,
    adapter: Ecto.Adapters.Postgres
end
