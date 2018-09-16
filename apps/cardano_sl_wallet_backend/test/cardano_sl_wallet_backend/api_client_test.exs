defmodule CardanoSLWalletBackend.APIClientTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias CardanoSLWalletBackend.APIClient

  setup_all do
    HTTPoison.start()
    :ok
  end

  describe "node_info/0" do
    test "successfully fetch node_info" do
      use_cassette "get_node_info_success" do
        assert {:ok, node_info} = APIClient.node_info()
        assert node_info == %{
          blockchain_height: %{quantity: 1_531_686, unit: "blocks"},
          local_blockchain_height: %{quantity: 1_531_686, unit: "blocks"},
          local_time_information: %{
            difference_from_ntp_server: %{quantity: 3520, unit: "microseconds"}
          },
          subscription_status: %{"52.68.30.216:3000:0": "subscribed"},
          sync_progress: %{quantity: 100, unit: "percent"},
          meta: %{
            pagination: %{page: 1, per_page: 1, total_entries: 1, total_pages: 1}
          }
        }
      end
    end
  end
end
