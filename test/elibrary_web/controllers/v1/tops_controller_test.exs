defmodule ElibraryWeb.V1.TopsControllerTest do
  use ElibraryWeb.ConnCase

  import ElibraryWeb.Router.Helpers

  alias Elibrary.Tops

  setup %{conn: conn} do
    book = insert(:book)
    comment = insert(:comment)
    user = insert(:user)
    conn = as_user(conn, user)
    {:ok, %{conn: conn, book: book, comment: comment, user: user}}
  end

  test "create/2 create_top for book test", %{conn: conn, book: book, user: user} do
    attrs = %{
      "estimation" => 5,
      "user_id" => user.id,
      "book_id" => book.id
    }

    response =
      conn
      |> post(tops_path(conn, :create), attrs)
      |> json_response(201)

    assert response == %{
             "top" => %{
               "id" => response["top"]["id"],
               "estimation" => attrs["estimation"],
               "user_id" => attrs["user_id"]
             }
           }
  end

  test "create/2 create_top for book with error test", %{conn: conn, book: book} do
    attrs = %{
      "estimation" => 5,
      "book_id" => book.id
    }

    response =
      conn
      |> post(tops_path(conn, :create), attrs)
      |> json_response(201)

    assert response == %{
             "top" => %{
               "id" => response["top"]["id"],
               "estimation" => attrs["estimation"],
               "user_id" => response["top"]["user_id"]
             }
           }

    attrs = %{
      "estimation" => 5,
      "book_id" => book.id
    }

    response =
      conn
      |> post(tops_path(conn, :create), attrs)
      |> json_response(201)

    assert response == %{
             "top" => %{
               "id" => response["top"]["id"],
               "estimation" => attrs["estimation"],
               "user_id" => response["top"]["user_id"]
             }
           }
  end

  test "create/2 create_top for comment test", %{conn: conn, comment: comment, user: user} do
    attrs = %{
      "estimation" => 5,
      "user_id" => user.id,
      "comment_id" => comment.id
    }

    response =
      conn
      |> post(tops_path(conn, :create), attrs)
      |> json_response(201)

    assert response == %{
             "top" => %{
               "id" => response["top"]["id"],
               "estimation" => attrs["estimation"],
               "user_id" => attrs["user_id"]
             }
           }
  end

  test "update/2 update top for book test", %{conn: conn, user: user} do
    top = insert(:top)

    attrs = %{
      "estimation" => 5
    }

    response =
      conn
      |> patch(tops_path(conn, :update, top, attrs))
      |> json_response(200)

    assert response == %{
             "top" => %{
               "id" => top.id,
               "estimation" => attrs["estimation"],
               "user_id" => user.id
             }
           }
  end

  test "delete/2 delete top test", %{conn: conn, book: book, user: user} do
    top = insert(:top, %{book_id: book, user_id: user})

    conn
    |> delete(tops_path(conn, :delete, top.id))
    |> json_response(200)

    assert {:error, :not_found} = Tops.get_top(top.id)
  end

  # @tag :xo
  # test "show/2 return avg top for book", %{conn: conn, book: book} do
  #   top = insert(:top, %{book_id: book})

  #   response =
  #     conn
  #     |> get(tops_path(conn, :show, %{id: top.book_id}))
  #     |> json_response(200)

  #   assert response == %{
  #     "estimation" => top.estimation
  #   }
  # end
end
