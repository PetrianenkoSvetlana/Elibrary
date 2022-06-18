defmodule ElibraryWeb.V1.CommentsView do
  use ElibraryWeb, :view

  # def render("index.json", %{page: page}) do
  #   %{
  #     entries: render_many(page.entries, __MODULE__, "show.json", as: :comment),
  #     page_number: page.page_number,
  #     page_size: page.page_size,
  #     total_entries: page.total_entries,
  #     total_pages: page.total_pages
  #   }
  # end

  def render("show.json", %{comment: comment}) do
    %{
      id: comment.id,
      comment: comment.comment,
      book_id: comment.book_id,
      user_id: comment.user_id,
      top: comment.top
    }
  end

  def render("create.json", %{comment: comment, current_user: current_user}) do
    %{
      comment: %{
        id: comment.id,
        comment: comment.comment,
        book_id: comment.book_id,
        user_id: comment.user_id
      },
      current_user: %{
        name: current_user.name,
        surname: current_user.surname
      }
    }
  end

  def render("update.json", %{comment: comment, current_user: current_user}) do
    %{
      comment: %{
        id: comment.id,
        comment: comment.comment,
        book_id: comment.book_id,
        user_id: comment.user_id,
        top: comment.top
      },
      current_user: %{
        name: current_user.name,
        surname: current_user.surname
      }
    }
  end

  def render("delete.json", %{}) do
    "Delete succesfully"
  end
end
