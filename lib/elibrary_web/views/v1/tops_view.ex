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

  def render("delete.json", %{top: top}) do
    %{}
  end

  # def render("show.json", %{top: top}) do
  #   %{
  #     estimation: top.estimation
  #   }
  # end
end
