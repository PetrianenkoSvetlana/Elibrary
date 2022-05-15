defmodule Elibrary.Books do
  alias Elibrary.Books.Commands.{
    CreateBook,
    DeleteBook,
    UpdateBook
  }
  alias Elibrary.Books.Queries.{
    GetBook,
    ListBooks
  }

  #Делегируем функции в Commands
  defdelegate create_book(attrs), to: CreateBook, as: :process
  defdelegate delete_book(book), to: DeleteBook, as: :process
  defdelegate update_book(book, attrs), to: UpdateBook, as: :process

  #Делегируем функции в Queries
  defdelegate get_book(id), to: GetBook, as: :process
  defdelegate list_books(), to: ListBooks, as: :process
end
