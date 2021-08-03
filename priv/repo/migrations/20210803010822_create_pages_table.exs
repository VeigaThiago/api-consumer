defmodule ApiConsumer.Repo.Migrations.CreatePagesTable do
  use Ecto.Migration

  def change do
    create table(:pages, primary_key: false)do
      add :id, :uuid, primary_key: true
      add :page, :integer
    end
  end
end
