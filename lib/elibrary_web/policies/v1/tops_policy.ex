defmodule ElibraryWeb.V1.TopsPolicy do
  @behaviour Bodyguard.Policy

  alias Elibrary.Accounts.Entities.User
  alias Elibrary.Tops.Entities.Top

  def authorize(action, %User{id: id}, %Top{user_id: id})
      when action in [:create, :update, :delete],
      do: :ok

  def authorize(_action, _user, _params), do: false
end
