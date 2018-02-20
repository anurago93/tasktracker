defmodule Tasktracker.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :createdBy, :string, null: false
      add :title, :text, null: false
      add :description, :text, null: false
      add :time, :integer
      add :completed, :boolean
      add :user_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:tasks, [:user_id])
  end
end
