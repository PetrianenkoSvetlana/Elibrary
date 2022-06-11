defmodule Elibrary.Factories do
  use ExMachina.Ecto, repo: Elibrary.Repo

  use Elibrary.Factories.{
    Accounts.UserFactory,
    Books.BookFactory,
    Tags.TagFactory,
    Comments.CommentFactory,
    Tops.TopFactory
  }
end
