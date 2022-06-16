defmodule Elibrary.Accounts.Guardian.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :elibrary,
    error_handler: Elibrary.Accounts.Guardian.ErrorHandler,
    module: Elibrary.Accounts.Services.Guardian

  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  # Load the user if either of the verifications worked
  plug Guardian.Plug.LoadResource, allow_blank: true
end
