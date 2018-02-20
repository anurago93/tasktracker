defmodule Tasktracker.Tracker.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasktracker.Tracker.Task


  schema "tasks" do
    field :completed, :boolean, default: false
    field :description, :string
    field :time, :integer, default: 0
    field :title, :string
    field :createdBy, :string
    belongs_to :user, Tasktracker.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:title, :description, :time, :completed, :createdBy, :user_id])
    |> validate_required([:title, :description, :createdBy, :user_id, :time])
  end
end
