defmodule ApiConsumer.Schemas.Page do
  use Ecto.Schema

  alias Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: false}

  schema "pages" do
    field :page, :integer
  end

  def changeset(page, params \\ %{}) do
    page
    |> Changeset.cast(params, [:page])
    |> Changeset.validate_required([:id, :page])
  end
end
