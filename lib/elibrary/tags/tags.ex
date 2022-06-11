defmodule Elibrary.Tags do
  alias Elibrary.Tags.Commands.{
    CreateTag,
    DeleteTag,
    UpdateTag
  }

  alias Elibrary.Tags.Queries.{
    GetTag,
    ListTags
  }

  # Делегируем функции в Commands
  defdelegate create_tag(attrs), to: CreateTag, as: :process
  defdelegate delete_tag(tag), to: DeleteTag, as: :process
  defdelegate update_tag(tag, attrs), to: UpdateTag, as: :process

  # Делегируем функции в Queries
  defdelegate get_tag(id), to: GetTag, as: :process
  defdelegate list_tags(), to: ListTags, as: :process
end
