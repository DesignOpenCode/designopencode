defmodule Designopencode.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :github_id, :string
      add :github_login, :string
      add :name, :string

      timestamps()
    end
  end
end
