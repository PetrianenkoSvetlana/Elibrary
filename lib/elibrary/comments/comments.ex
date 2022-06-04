defmodule Elibrary.Comments.Comments do
  alias Elibrary.Comments.Commands.{
    CreateComment,
    DeleteComment,
    UpdateComment
  }
  alias Elibrary.Comments.Queries.{
    GetComment,
    ListComments
  }

  #Делегируем функции в Commands
  defdelegate create_comment(attrs), to: CreateComment, as: :process
  defdelegate delete_comment(comment), to: DeleteComment, as: :process
  defdelegate update_comment(comment, attrs), to: UpdateComment, as: :process

  #Делегируем функции в Queries
  defdelegate get_comment(id), to: GetComment, as: :process
  defdelegate list_comments(), to: ListComments, as: :process
  #defdelegate list_comments(book, params \\ %{}), to: ListComments, as: :process
end
