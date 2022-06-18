defmodule ElibraryWeb.V1.UserControllerTest do
  use ElibraryWeb.ConnCase

  import ElibraryWeb.Router.Helpers

  setup %{conn: conn} do
    user = insert(:user, %{password: "76ygvtd587gS"})
    conn = as_user(conn, user)
    {:ok, %{conn: conn, user: user}}
  end

  test "create/2 create user", %{conn: conn} do
    attrs = %{
      "email" => "hhdsjnh@hajdh.com",
      "password" => "76ygvtd587gS"
    }

    response =
      conn
      |> post(user_path(conn, :create), attrs)
      |> json_response(201)

    assert response == %{
             "access_token" => response["access_token"],
             "refresh_token" => response["refresh_token"],
             "user" => %{
               "id" => response["user"]["id"],
               "birthday" => nil,
               "city" => nil,
               "country" => nil,
               "email" => "hhdsjnh@hajdh.com",
               "name" => nil,
               "patronymic" => nil,
               "surname" => nil
             }
           }
  end

  test "create/2 create user with error", %{conn: conn} do
    attrs = %{
      "email" => "hhdsjnh@hajdh.com"
    }

    response =
      conn
      |> post(user_path(conn, :create), attrs)
      |> json_response(422)

    assert response == %{"errors" => [%{"code" => "can't be blank", "field" => "password"}]}

    attrs = %{
      "password" => "76ygvtd587gS"
    }

    response =
      conn
      |> post(user_path(conn, :create), attrs)
      |> json_response(422)

    assert response == %{"errors" => [%{"code" => "can't be blank", "field" => "email"}]}
  end

  test "update/2 update user", %{conn: conn, user: user} do
    attrs = %{
      "city" => "Toronto",
      "name" => "Svetlana",
      "patronymic" => "Dmitrievna",
      "surname" => "Petrianenko"
    }

    response =
      conn
      |> patch(user_path(conn, :update, user, attrs))
      |> json_response(200)

    assert response == %{
             "user" => %{
               "id" => user.id,
               "birthday" => nil,
               "city" => attrs["city"],
               "country" => user.country,
               "email" => user.email,
               "name" => attrs["name"],
               "patronymic" => attrs["patronymic"],
               "surname" => attrs["surname"]
             }
           }
  end

  test "update/2 update user with error", %{conn: conn, user: user} do
    attrs = %{
      "email" => ""
    }

    response =
      conn
      |> patch(user_path(conn, :update, user, attrs))
      |> json_response(200)

    assert response == %{
             "user" => %{
               "id" => user.id,
               "birthday" => user.birthday,
               "city" => user.city,
               "country" => user.country,
               "email" => user.email,
               "name" => user.name,
               "patronymic" => user.patronymic,
               "surname" => user.surname
             }
           }
  end
end
