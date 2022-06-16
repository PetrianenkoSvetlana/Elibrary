defmodule ElibraryWeb.V1.CommentsControllerTest do
  use ElibraryWeb.ConnCase

  import ElibraryWeb.Router.Helpers

  alias Elibrary.Comments

  setup %{conn: conn} do
    books = insert_list(2, :book)
    user = insert(:user)
    conn = as_user(conn, user)
    {:ok, %{conn: conn, book: books, user: user}}
  end

  test "index/2 return list_comments", %{conn: conn, book: books, user: user} do
    [book_1, book_2] = books

    [comment_1, comment_2] = insert_list(2, :comment, %{book: book_1, user: user})
    insert_list(2, :comment, %{book: book_2, user: user})

    attrs = %{page: 1, page_size: 10, book_id: book_1.id}

    response =
      conn
      |> get(comments_path(conn, :index), attrs)
      |> json_response(200)

    assert response ==
             %{
               "entries" => [
                 %{
                   "id" => comment_1.id,
                   "comment" => comment_1.comment,
                   "book_id" => comment_1.book_id,
                   "user_id" => comment_1.user_id,
                   "top" => comment_1.top
                 },
                 %{
                   "id" => comment_2.id,
                   "comment" => comment_2.comment,
                   "book_id" => comment_2.book_id,
                   "user_id" => comment_2.user_id,
                   "top" => comment_2.top
                 }
               ],
               "page_number" => 1,
               "page_size" => 10,
               "total_entries" => 2,
               "total_pages" => 1
             }
  end

  test "create/2 create_comment test", %{conn: conn, book: books, user: user} do
    [book_1, _book_2] = books

    attrs = %{
      "comment" => "Good book!",
      "book_id" => book_1.id
    }

    response =
      conn
      |> post(comments_path(conn, :create), attrs)
      |> json_response(201)

    assert response == %{
             "comment" => %{
               "id" => response["comment"]["id"],
               "comment" => attrs["comment"],
               "book_id" => attrs["book_id"],
               "user_id" => user.id
             },
             "current_user" => %{
               "name" => user.name,
               "surname" => user.surname
             }
           }
  end

  test "update/2 update comment", %{conn: conn, user: user} do
    comment = insert(:comment)

    attrs = %{
      "comment" => "Funny book"
    }

    response =
      conn
      |> patch(comments_path(conn, :update, comment, attrs))
      |> json_response(200)

    assert response == %{
             "comment" => %{
               "id" => comment.id,
               "comment" => attrs["comment"],
               "book_id" => comment.book_id,
               "user_id" => user.id,
               "top" => comment.top
             },
             "current_user" => %{
               "name" => user.name,
               "surname" => user.surname
             }
           }
  end

  test "delete/2 delete comment", %{conn: conn, book: books, user: user} do
    [book_1, _book_2] = books
    comment = insert(:comment, %{book: book_1, user: user})

    conn
    |> delete(comments_path(conn, :delete, comment.id))
    |> json_response(200)

    assert {:error, :not_found} = Comments.get_comment(comment.id)
  end
end
