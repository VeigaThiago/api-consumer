defmodule ApiConsumer.Transformer do
  alias ApiConsumer.Queries.Number, as: NumberQuery
  alias ApiConsumer.Repo

  def number_sort() do
    NumberQuery.get_numbers()
    |> Repo.all()
    |> sort()
  end

  def sort([]), do: []

  def sort([pivot | rest]) do
    {less_than, greater_than} = split(rest, pivot)
    sort(less_than) ++ [pivot] ++ sort(greater_than)
  end

  def split(list, pivot) do
    list
    |> Enum.group_by(fn x ->
      x < pivot
    end)
    |> case do
      %{false: greater_than, true: less_than} ->
        {less_than, greater_than}

      %{false: greater_than} ->
        {[], greater_than}

      %{true: less_than} ->
        {less_than, []}

      %{} ->
        {[], []}
    end
  end
end
