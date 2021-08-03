defmodule ApiConsumer.Stores.Insert do
  alias Ecto.Multi
  alias ApiConsumer.Repo

  def insert_page(struct) do
    struct
    |> Repo.insert!()
  end

  def insert_numbers(map) do
    map
    |> Enum.reduce(Multi.new(), fn changeset, multi ->
      Multi.insert(
        multi,
        {:insert_numbers, changeset},
        changeset,
        on_conflict: :nothing
      )
    end)
    |> Repo.transaction()
  end
end
