defmodule Elibrary.Repo do
  use Ecto.Repo,
    otp_app: :elibrary,
    adapter: Ecto.Adapters.Postgres

  def find(query, id) do
    case __MODULE__.get(query, id) do
      %_{} = schema ->
        {:ok, schema}
      nil ->
        {:error, :not_found}
    end
  end
end
