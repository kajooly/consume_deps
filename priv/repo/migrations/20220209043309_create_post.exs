defmodule ComsumeDeps.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:post, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :username, :string
      add :body, :string
      add :replys, :integer

      timestamps()
    end
  end
end
