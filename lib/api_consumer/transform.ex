defmodule ApiConsumer.Transformer do
  alias ApiConsumer.Queries.Number, as: NumberQuery
  alias ApiConsumer.Repo

  @doc """
  ApiConsumer.Transformer.number_sort() get all number table inserted numbers and
  sort this numbers
  """
  def number_sort() do
    NumberQuery.get_numbers()
    |> Repo.all()
    |> sort()
  end

  @doc """
  ApiConsumer.Transformer.sort() receive a list with numbers and acts recursively
  run for all array, this function split array in less than pivot array, pivot and
  greater than pivot array. Calling those little arrays until all the
  pivots are in place.
  """
  def sort([]), do: []

  def sort([pivot | rest]) do
    {less_than, greater_than} = split(rest, pivot)
    sort(less_than) ++ [pivot] ++ sort(greater_than)
  end

  defp split(list, pivot) do
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
