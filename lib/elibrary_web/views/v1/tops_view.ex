defmodule ElibraryWeb.V1.TopsView do
  use ElibraryWeb, :view

  def render("create.json", %{top: top}) do
    %{
      top: %{
        id: top.id,
        estimation: top.estimation,
        user_id: top.user_id
      }
    }
  end

  def render("update.json", %{top: top}) do
    %{
      top: %{
        id: top.id,
        estimation: top.estimation,
        user_id: top.user_id
      }
    }
  end

  def render("delete.json", %{top: _top}) do
    "Delete succesfully"
  end
end
