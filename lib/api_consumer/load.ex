defmodule ApiConsumer.Load do
  alias ApiConsumer.Transformer

  def number_sort_query(_parent, _args, _resolution) do
    {:ok, %{all_numbers: Transformer.number_sort()}}
  end
end
