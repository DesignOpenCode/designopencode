defmodule Designopencode.Account.User do
  @moduledoc """
  This module contains functions and Ecto schema related to a user account.
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:email, :string)
    field(:github_id, :string)
    field(:github_login, :string)
    field(:name, :string)

    timestamps()
  end

  @optional_fields [:name]
  @required_fields [:email, :github_login, :github_id]

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @optional_fields ++ @required_fields)
    |> validate_required(@required_fields)
  end
end
