defmodule ApiConsumer.Absinthe.Numbers do
  use Absinthe.Schema.Notation

  object :all_numbers do
    field :all_numbers, list_of(:float)
  end
end
