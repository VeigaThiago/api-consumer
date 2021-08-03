defmodule ApiConsumer.Load do
  alias ApiConsumer.Transformer

  @doc """
  ApiConsumer.Load.number_sort_query() prepares a return for absinthe query
  """
  def number_sort_query(_parent, _args, _resolution) do
    {:ok, %{all_numbers: Transformer.number_sort()}}
  end
end
