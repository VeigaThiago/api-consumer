defmodule ApiConsumer.ApiConsumerTest do
  use ExUnit.Case
  alias ApiConsumer.Transformer

  describe "test sort algorithm" do
    test "test sort algorithm with invert vector" do
      Transformer.sort([9, 8, 7, 6, 5, 4, 3, 2, 1]) == [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    test "test sort algorithm with random vector" do
      Transformer.sort([9, 5, 1, 2, 8, 4, 3, 6, 7]) == [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    test "test sort algorithm withone member" do
      Transformer.sort([5]) == [5]
    end

    test "test sort algorithm without vector" do
      Transformer.sort([]) == []
    end
  end
end
