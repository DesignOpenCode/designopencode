defmodule Designopencode.Repo do
  use Ecto.Repo,
    otp_app: :designopencode,
    adapter: Ecto.Adapters.Postgres
end
