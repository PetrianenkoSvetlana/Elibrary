defmodule ElibraryWeb.V1.TopsController do
  use ElibraryWeb, :controller

  alias Elibrary.Tops
  alias ElibraryWeb.ApplyParams

  action_fallback(ElibraryWeb.FallbackController)

  defmodule CreateTopParams do
    use Params.Schema, %{
      estimation!: :integer,
      book_id: :integer,
      comment_id: :integer
    }
  end

  defmodule UpdateTopParams do
    use Params.Schema, %{
      estimation: :integer,
      book_id: :integer,
      comment_id: :integer
    }
  end

  def create(conn, %{"current_user" => current_user} = param) do
    with {:ok, param} <- ApplyParams.do_apply(CreateTopParams, param),
         param <- Map.put(param, :user_id, current_user.id),
         {:ok, top} <- Tops.create_top(param) do
      conn
      |> put_status(:created)
      |> render("create.json", %{top: top})
    end
  end

  def update(conn, %{"current_user" => current_user, "id" => id} = param) do
    with {:ok, param} <- ApplyParams.do_apply(UpdateTopParams, param),
         param <- Map.put(param, :user_id, current_user.id),
         {:ok, top} <- Tops.get_top(id),
         {:ok, top} <- Tops.update_top(top, param) do
      render(conn, "update.json", %{top: top, current_user: current_user})
    end
  end

  def delete(conn, %{"current_user" => current_user, "id" => id}) do
    with {:ok, top} <- Tops.get_top(id) do
      if top.user_id == current_user.id do
        Tops.delete_top(top)
        render(conn, "delete.json", %{top: top})
      end
    end
  end

  # def show(conn, %{"id" => id}) do
  #   with {:ok, top} <- Tops.get_top(id) |> IO.inspect() do
  #     IO.inspect(top)
  #     if is_nil(top.book_id) do
  #       with top <- Tops.avg_estimation_comment(id) do
  #         render(conn, "show.json", %{top: top})
  #       end
  #     end
  #     if is_nil(top.comment_id) do
  #       with top <- Tops.avg_estimation_book(id) do
  #         render(conn, "show.json", %{top: top})
  #       end
  #     end
  #   end
  # end
end
