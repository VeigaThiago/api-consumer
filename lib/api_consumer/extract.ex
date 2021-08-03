defmodule ApiConsumer.Extract do
  use Tesla

  alias ApiConsumer.Schemas.Number
  alias ApiConsumer.Schemas.Page
  alias ApiConsumer.Repo
  alias Ecto.Multi

  plug(Tesla.Middleware.BaseUrl, "http://challenge.dienekes.com.br/api/numbers")
  plug(Tesla.Middleware.JSON)

  def consumer(page \\ 1) do
    with true <- Enum.any?(get_numbers(page)) do
      get_numbers(page)
      |> insert_numbers

      consumer(page + 1)
    end

    :all_numbers_read
  end

  def get_numbers(page, count \\ 0) do
    {:ok, response} = get("?page=" <> to_string(page))

    case response.body do
      %{"error" => _} ->
        if count < 10 do
          IO.inspect(count)
          get_numbers(page, count + 1)
        else
          Repo.insert!(%Page{id: UUID.uuid4(), page: page})
          get_numbers(page + 1)
        end

      %{"numbers" => numbers} ->
        numbers
        |> Enum.map(fn number ->
          Number.changeset(%Number{id: UUID.uuid4(), number: number})
        end)
        |> IO.inspect()
    end
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
