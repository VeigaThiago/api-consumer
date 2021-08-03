defmodule ApiConsumer.Schemas.Number do
  use Ecto.Schema

  alias Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: false}

  schema "numbers" do
    field :number, :float
  end

  def changeset(number, params \\ %{}) do
    number
    |> Changeset.cast(params, [:number])
    |> Changeset.validate_required([:id, :number])
  end
end
