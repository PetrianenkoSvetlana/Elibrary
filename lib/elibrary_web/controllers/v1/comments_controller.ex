defmodule ElibraryWeb.V1.CommentsController do
  use ElibraryWeb, :controller

  alias Elibrary.Comments
  alias ElibraryWeb.ApplyParams
  alias ElibraryWeb.V1.CommentPolicy

  action_fallback(ElibraryWeb.FallbackController)

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

  # def index(conn, %{"book_id" => book_id} = params) do
  #   IO.inspect(params)
  #   page = Comments.list_comments(book_id, params)
  #   render(conn, "index.json", %{page: page})
  # end

  def create(conn, %{"current_user" => current_user} = param) do
    with {:ok, param} <- ApplyParams.do_apply(CreateCommentParams, param),
         param <- Map.put(param, :user_id, current_user.id),
         {:ok, comment} <- Comments.create_comment(param),
         :ok <- Bodyguard.permit(CommentPolicy, :create, current_user, comment) do
      conn
      |> put_status(:created)
      |> render("create.json", %{comment: comment, current_user: current_user})
    end
  end

  def update(conn, %{"current_user" => current_user, "id" => id} = param) do
    with {:ok, param} <- ApplyParams.do_apply(UpdateCommentParams, param),
         param <- Map.put(param, :user_id, current_user.id),
         {:ok, comment} <- Comments.get_comment(id),
         :ok <- Bodyguard.permit(CommentPolicy, :update, current_user, comment),
         {:ok, comment} <- Comments.update_comment(comment, param) do
      render(conn, "update.json", %{comment: comment, current_user: current_user})
    end
  end

  def delete(conn, %{"current_user" => current_user, "id" => id}) do
    with {:ok, comment} <- Comments.get_comment(id),
         :ok <- Bodyguard.permit(CommentPolicy, :delete, current_user, comment) do
      # if comment.user_id == current_user.id do
      Comments.delete_comment(comment)
      render(conn, "delete.json", %{})
      # end
    end
  end
end
