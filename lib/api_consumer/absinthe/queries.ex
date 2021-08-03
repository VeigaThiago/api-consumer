defmodule ApiConsumer.Absinthe.Queries do
  use Absinthe.Schema

  import_types(ApiConsumer.Absinthe.Numbers)

  alias ApiConsumer.Load

  query do
    @desc "Get all posts"
    field :get_numbers, :all_numbers do
      resolve(&Load.number_sort_query/3)
    end
  end
end
