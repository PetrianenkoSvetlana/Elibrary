defmodule Elibrary.Accounts.Guardian.ErrorHandler do
  use ElibraryWeb, :controller

  alias Elibrary.Changeset.Error
  alias ElibraryWeb.ErrorView

  def auth_error(conn, {type, __reason}, _opts) do
    error =
      type
      |> to_string()
      |> Error.auth_error()

    conn
    |> put_status(401)
    |> put_view(ErrorView)
    |> render("401.json", error: error)
  end
end
