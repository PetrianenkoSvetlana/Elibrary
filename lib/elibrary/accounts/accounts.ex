defmodule Elibrary.Accounts do
  alias Elibrary.Accounts.Commands.{
    CreateUser,
    DeleteUser,
    UpdateUser
  }

  alias Elibrary.Accounts.Queries.{
    GetUser,
    ListUsers
  }

  #Делегируем функции в Commands
  defdelegate create_user(attrs), to: CreateUser, as: :process
  defdelegate delete_user(user), to: DeleteUser, as: :process
  defdelegate update_user(user, attrs), to: UpdateUser, as: :process

  #Делегируем функции в Queries
  defdelegate get_user(id), to: GetUser, as: :process
  defdelegate list_users(), to: ListUsers, as: :process

end
