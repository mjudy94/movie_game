defmodule MovieGame.Repo do
  use Ecto.Repo,
    otp_app: :movie_game,
    adapter: Ecto.Adapters.Postgres
end
