defmodule ApiConsumer.Queries.Number do
  import Ecto.Query
  alias ApiConsumer.Schemas.Number

  def get_numbers() do
    from n in Number,
      select: n.number
  end
end
