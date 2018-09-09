defmodule CardanoSLWalletBackend.APIClient do
  @moduledoc """
  Cardano Wallet API V1
  """
  @behaviour CardanoSLWalletBackend

  use HTTPoison.Base

  import Utilities.Map, only: [to_underscore_keys: 1, to_atom_keys: 1]

  @expected_fields ~w(
    data meta status
  )


  @impl CardanoSLWalletBackend
  def node_info() do
    case get("/node-info") do
      {:ok, %HTTPoison.Response{body: %{data: data}, status_code: 200}} -> {:ok, data}
    end
  end

  @impl HTTPoison.Base
  def process_url(url) do
    "https://localhost:8090" <> "/api/v1" <> url
  end

  @impl HTTPoison.Base
  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Map.take(@expected_fields)
    |> to_underscore_keys()
    |> to_atom_keys()
  end

  @impl HTTPoison.Base
  defp process_request_headers(headers), do: headers ++ [{"Content-Type", "application/json;charset=utf-8"}]

  @impl HTTPoison.Base
  def process_request_options(options)  do
    cacert_filename = Application.get_env(:cardano_sl_wallet_backend, :cacert_filename)
    cert_filename = Application.get_env(:cardano_sl_wallet_backend, :cert_filename)
    cacert_file_path = [:code.priv_dir(:cardano_sl_wallet_backend), cacert_filename] |> Path.join()
    cert_file_path = [:code.priv_dir(:cardano_sl_wallet_backend), cert_filename] |> Path.join()
    ssl = [cacertfile: cacert_file_path, certfile: cert_file_path]
    timeout = 500
    options ++ [ssl: ssl, timeout: timeout]
  end

end
