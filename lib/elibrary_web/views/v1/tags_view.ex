defmodule ElibraryWeb.V1.TagsView do
  use ElibraryWeb, :view

  def render("show.json", %{tag: tag}) do
    %{
      tag: tag.tag
    }
  end
end
