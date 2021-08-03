defmodule ApiConsumer.Repo.Migrations.CreateNumbersTable do
  use Ecto.Migration

  def change do
    create table(:numbers, primary_key: false)do
      add :id, :uuid, primary_key: true
      add :number, :float
    end
  end
end
