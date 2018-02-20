defmodule TasktrackerWeb.PageController do
  use TasktrackerWeb, :controller

  alias Tasktracker.Tracker
  alias Tasktracker.Accounts

  def index(conn, _params) do
    render conn, "index.html"
  end

  def feed(conn, _params) do
  	tasks = Tracker.list_tasks()
  	IO.inspect tasks == []
  	new_task = %Tasktracker.Tracker.Task{ user_id: conn.assigns[:current_user].id }
  	changeset = Tracker.change_task(new_task)
  	assigned_to = for x <- Accounts.list_users() do
                  x.name
                  end
    render conn, "feed.html", tasks: tasks, changeset: changeset, assigned_to: assigned_to
  end
end
