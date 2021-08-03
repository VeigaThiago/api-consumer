defmodule ApiConsumer.Extract do
  use Tesla

  alias ApiConsumer.Schemas.Number
  alias ApiConsumer.Schemas.Page
  alias ApiConsumer.Stores.Insert

  plug(Tesla.Middleware.BaseUrl, "http://challenge.dienekes.com.br/api/numbers")
  plug(Tesla.Middleware.JSON)

  @doc """
  ApiConsumer.Extract.consumer() call Tesla HTTP client and acts recursively until
  check all pages. In case that one fail page request, our application will try
  10 times the same page, if fail persists, the page will be insert in Page table
  and we can call just this page calling ApiConsumer.Extract.consumer_one_page(fail_page).
  """
  def consumer(page \\ 1) do
    with true <- Enum.any?(get_numbers(page)) do
      consumer_one_page(page)

      consumer(page + 1)
    end

    :all_numbers_read
  end

  def consumer_one_page(page) do
    get_numbers(page)
    |> Insert.insert_numbers()
  end

  defp get_numbers(page, count \\ 0) do
    {:ok, response} = get("?page=" <> to_string(page))

    case response.body do
      %{"error" => _} ->
        if count < 10 do
          get_numbers(page, count + 1)
        else
          Insert.insert_page(%Page{id: UUID.uuid4(), page: page})
          get_numbers(page + 1)
        end

      %{"numbers" => numbers} ->
        numbers
        |> Enum.map(fn number ->
          Number.changeset(%Number{id: UUID.uuid4(), number: number})
        end)
    end
  end
end
