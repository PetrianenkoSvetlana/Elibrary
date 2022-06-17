defmodule ElibraryWeb.V1.BooksControllerTest do
  use ElibraryWeb.ConnCase

  import ElibraryWeb.Router.Helpers

  setup %{conn: conn} do
    {:ok, %{conn: conn}}
  end

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
               "country" => book.country,
               "creation_year" => book.creation_year,
               "date_of_publication" => book.date_of_publication,
               "id" => book.id,
               "language" => book.language,
               "publisher" => book.publisher,
               "thematics" => book.thematics,
               "title" => book.title,
               "top" => book.top,
               "type" => book.type
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

  test "show/2 return book with error", %{conn: conn} do
    [tag_1, tag_2] = insert_list(2, :tag)
    book = insert(:book, %{tags: [tag_1, tag_2]})
    insert_list(2, :comment, %{book: book})

    response =
      conn
      |> get(books_path(conn, :show, 345344534))
      |> json_response(404)

    assert response == %{"errors" => ["Not found"]}
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

  test "index/2 return list books with string fields", %{conn: conn} do
    book_1 = insert(:book, %{title: "Война и мир", author: "Толстой Л.Н.", publisher: "Художественная литература", tags: [insert(:tag, %{tag: "horror"})], creation_year: 1984})
    book_2 = insert(:book, %{title: "Юность", author: "Толстой Л.Н.", publisher: "Вече", tags: [insert(:tag, %{tag: "doram"})], creation_year: 1678})
    book_3 = insert(:book, %{title: "Тихи Дон", author: "Шолохов М.А..", publisher: "Художественная литература", tags: [insert(:tag, %{tag: "horror"})], creation_year: 1984})

    attrs = %{page: 1, page_size: 10, tag: "horror"}

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
                   "title" => book_3.title,
                   "type" => book_3.type,
                   "author" => book_3.author,
                   "publisher" => book_3.publisher,
                   "language" => book_3.language,
                   "creation_year" => book_3.creation_year,
                   "thematics" => book_3.thematics,
                   "top" => book_3.top
                 }
               ],
               "page_number" => 1,
               "page_size" => 10,
               "total_entries" => 2,
               "total_pages" => 1
             }

    attrs = %{page: 1, page_size: 10, title: "Юность"}

    response =
      conn
      |> get(books_path(conn, :index), attrs)
      |> json_response(200)

    assert response ==
              %{
                "entries" => [
                  %{
                    "title" => book_2.title,
                    "type" => book_2.type,
                    "author" => book_2.author,
                    "publisher" => book_2.publisher,
                    "language" => book_2.language,
                    "creation_year" => book_2.creation_year,
                    "thematics" => book_2.thematics,
                    "top" => book_2.top
                  }
                ],
                "page_number" => 1,
                "page_size" => 10,
                "total_entries" => 1,
                "total_pages" => 1
              }

    attrs = %{page: 1, page_size: 10, author: "Толстой Л.Н."}

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
                  }
                ],
                "page_number" => 1,
                "page_size" => 10,
                "total_entries" => 2,
                "total_pages" => 1
              }

    attrs = %{page: 1, page_size: 10, publisher: "Вече"}

    response =
      conn
      |> get(books_path(conn, :index), attrs)
      |> json_response(200)

    assert response ==
              %{
                "entries" => [
                  %{
                    "title" => book_2.title,
                    "type" => book_2.type,
                    "author" => book_2.author,
                    "publisher" => book_2.publisher,
                    "language" => book_2.language,
                    "creation_year" => book_2.creation_year,
                    "thematics" => book_2.thematics,
                    "top" => book_2.top
                  }
                ],
                "page_number" => 1,
                "page_size" => 10,
                "total_entries" => 1,
                "total_pages" => 1
              }

    attrs = %{page: 1, page_size: 10, tag: "sgdfgdg"}

    response =
      conn
      |> get(books_path(conn, :index), attrs)
      |> json_response(200)

    assert response ==
             %{
               "entries" => [
               ],
               "page_number" => 1,
               "page_size" => 10,
               "total_entries" => 0,
               "total_pages" => 1
             }
  end

  test "index/2 return list books with filter", %{conn: conn} do
    book_1 = insert(:book, %{creation_year: 1984})
    book_2 = insert(:book, %{creation_year: 1678})
    book_3 = insert(:book, %{creation_year: 1984})
    book_4 = insert(:book, %{creation_year: 1876})
    book_5 = insert(:book, %{creation_year: 2022})

    attrs = %{page: 1, page_size: 10, from: 1800, to: 1990}

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
               "total_entries" => 3,
               "total_pages" => 1
             }

    attrs = %{page: 1, page_size: 10, from: 1800}

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
                },
                %{
                  "title" => book_5.title,
                  "type" => book_5.type,
                  "author" => book_5.author,
                  "publisher" => book_5.publisher,
                  "language" => book_5.language,
                  "creation_year" => book_5.creation_year,
                  "thematics" => book_5.thematics,
                  "top" => book_5.top
                }
               ],
               "page_number" => 1,
               "page_size" => 10,
               "total_entries" => 4,
               "total_pages" => 1
             }

             attrs = %{page: 1, page_size: 10, to: 1800}

    response =
      conn
      |> get(books_path(conn, :index), attrs)
      |> json_response(200)

    assert response ==
             %{
               "entries" => [
                 %{
                   "title" => book_2.title,
                   "type" => book_2.type,
                   "author" => book_2.author,
                   "publisher" => book_2.publisher,
                   "language" => book_2.language,
                   "creation_year" => book_2.creation_year,
                   "thematics" => book_2.thematics,
                   "top" => book_2.top
                 }
               ],
               "page_number" => 1,
               "page_size" => 10,
               "total_entries" => 1,
               "total_pages" => 1
             }

    attrs = %{page: 1, page_size: 10, from: "GHbdtn", to: "GHbdtn"}

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
                },
                %{
                  "title" => book_5.title,
                  "type" => book_5.type,
                  "author" => book_5.author,
                  "publisher" => book_5.publisher,
                  "language" => book_5.language,
                  "creation_year" => book_5.creation_year,
                  "thematics" => book_5.thematics,
                  "top" => book_5.top
                }
               ],
               "page_number" => 1,
               "page_size" => 10,
               "total_entries" => 5,
               "total_pages" => 1
             }
  end
end
