defmodule ElibraryWeb.V1.Elibrary do
  @behaviour Bodyguard.Policy

  alias Elibrary.Accounts.Entities.User
  alias Elibrary.Comments.Entities.Comment

  def authorize(action, %User{id: id}, %Comment{user_id: id})
      when action in [:create, :update, :delete],
      do: :ok

  def authorize(_action, _user, _params), do: false
end
