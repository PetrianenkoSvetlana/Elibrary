defmodule ElibraryWeb.V1.CommentsController do
  use ElibraryWeb, :controller

  alias Elibrary.Comments
  alias ElibraryWeb.ApplyParams

  defmodule CreateCommentParams do
    use Params.Schema, %{
      comment!: :string,
      book_id!: :integer
    }
  end

  defmodule UpdateCommentParams do
    use Params.Schema, %{
      comment: :string,
      book_id: :integer,
      top: :float
    }
  end

  action_fallback(ElibraryWeb.FallbackController)

  # def index(conn, %{"book_id" => book_id} = params) do
  #   IO.inspect(params)
  #   page = Comments.list_comments(book_id, params)
  #   render(conn, "index.json", %{page: page})
  # end

  def create(conn, %{"current_user" => current_user} = param) do
    with {:ok, param} <- ApplyParams.do_apply(CreateCommentParams, param),
         param <- Map.put(param, :user_id, current_user.id),
         {:ok, comment} <- Comments.create_comment(param) do
      conn
      |> put_status(:created)
      |> render("create.json", %{comment: comment, current_user: current_user})
    end
  end

  def update(conn, %{"current_user" => current_user, "id" => id} = param) do
    with {:ok, param} <- ApplyParams.do_apply(UpdateCommentParams, param),
         param <- Map.put(param, :user_id, current_user.id),
         {:ok, comment} <- Comments.get_comment(id),
         {:ok, comment} <- Comments.update_comment(comment, param) do
      render(conn, "update.json", %{comment: comment, current_user: current_user})
    end
  end

  def delete(conn, %{"current_user" => current_user, "id" => id}) do
    with {:ok, comment} <- Comments.get_comment(id) do
      if comment.user_id == current_user.id do
        Comments.delete_comment(comment)
        render(conn, "delete.json", %{comment: comment})
      end
    end
  end
end
