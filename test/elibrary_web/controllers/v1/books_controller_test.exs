defmodule ElibraryWeb.V1.BooksControllerTest do
  use ElibraryWeb.ConnCase

  import ElibraryWeb.Router.Helpers

  setup %{conn: conn} do
    {:ok, %{conn: conn}}
  end

  @tag :xo
  test "show/2 return book", %{conn: conn} do
    [tag_1, tag_2] = insert_list(2, :tag)
    book = insert(:book, %{tags: [tag_1, tag_2]})
    [comment_1, comment_2] = insert_list(2, :comment, %{book: book})

    response =
      conn
      |> get(books_path(conn, :show, book.id))
      |> json_response(200)

    assert response == %{
             "book" => %{
               "ISBN" => book."ISBN",
               "author" => book.author,
               "country" => nil,
               "creation_year" => nil,
               "date_of_publication" => nil,
               "id" => book.id,
               "language" => nil,
               "publisher" => book.publisher,
               "thematics" => book.thematics,
               "title" => book.title,
               "top" => nil,
               "type" => nil
             },
             "tags" => [%{"tag" => tag_1.tag}, %{"tag" => tag_2.tag}],
             "comments" => %{
               "entries" => [
                 %{
                   "comment" => comment_1.comment,
                   "book_id" => comment_1.book_id,
                   "id" => comment_1.id,
                   "top" => comment_1.top,
                   "user_id" => comment_1.user_id
                 },
                 %{
                   "comment" => comment_2.comment,
                   "book_id" => comment_2.book_id,
                   "id" => comment_2.id,
                   "top" => comment_2.top,
                   "user_id" => comment_2.user_id
                 }
               ],
               "page_number" => 1,
               "page_size" => 10,
               "total_entries" => 2,
               "total_pages" => 1
             }
           }
  end

  test "index/2 return list books", %{conn: conn} do
    [book_1, book_2, book_3, book_4] = insert_list(4, :book)

    attrs = %{page: 1, page_size: 10}

    response =
      conn
      |> get(books_path(conn, :index), attrs)
      |> json_response(200)

    assert response ==
             %{
               "entries" => [
                 %{
                   "title" => book_1.title,
                   "type" => book_1.type,
                   "author" => book_1.author,
                   "publisher" => book_1.publisher,
                   "language" => book_1.language,
                   "creation_year" => book_1.creation_year,
                   "thematics" => book_1.thematics,
                   "top" => book_1.top
                 },
                 %{
                   "title" => book_2.title,
                   "type" => book_2.type,
                   "author" => book_2.author,
                   "publisher" => book_2.publisher,
                   "language" => book_2.language,
                   "creation_year" => book_2.creation_year,
                   "thematics" => book_2.thematics,
                   "top" => book_2.top
                 },
                 %{
                   "title" => book_3.title,
                   "type" => book_3.type,
                   "author" => book_3.author,
                   "publisher" => book_3.publisher,
                   "language" => book_3.language,
                   "creation_year" => book_3.creation_year,
                   "thematics" => book_3.thematics,
                   "top" => book_3.top
                 },
                 %{
                   "title" => book_4.title,
                   "type" => book_4.type,
                   "author" => book_4.author,
                   "publisher" => book_4.publisher,
                   "language" => book_4.language,
                   "creation_year" => book_4.creation_year,
                   "thematics" => book_4.thematics,
                   "top" => book_4.top
                 }
               ],
               "page_number" => 1,
               "page_size" => 10,
               "total_entries" => 4,
               "total_pages" => 1
             }
  end
end
