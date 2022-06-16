defmodule ElibraryWeb.V1.UserView do
  use ElibraryWeb, :view

  def render("create.json", %{
        user: user,
        access_token: access_token,
        refresh_token: refresh_token
      }) do
    %{
      access_token: access_token,
      refresh_token: refresh_token,
      user: %{
        id: user.id,
        email: user.email,
        name: user.name,
        surname: user.surname,
        patronymic: user.patronymic,
        birthday: user.birthday,
        country: user.country,
        city: user.city
      }
    }
  end

  def render("update.json", %{user: user}) do
    %{
      user: %{
        id: user.id,
        email: user.email,
        name: user.name,
        surname: user.surname,
        patronymic: user.patronymic,
        birthday: user.birthday,
        country: user.country,
        city: user.city
      }
    }
  end
end
