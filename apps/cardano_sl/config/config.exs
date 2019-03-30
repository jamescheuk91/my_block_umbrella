use Mix.Config

cardano_sl_mainnet_production_node_id = :cardano_sl_mainnet_producation_node0

config :cardano_sl, nodes: [
  %{
    id: cardano_sl_mainnet_production_node_id,
    network: :cardano_sl_mainnet_producation,
    wallet_api_scheme: "https",
    wallet_api_host: "localhost",
    wallet_api_port: 8090
  }
]

config :cardano_sl, CardanoSL.Scheduler,
  jobs: [
    initialize_mainnet_production_node_info: [
      # Runs once, at startup
      schedule: {:extended, "@reboot"},
      task: {CardanoSL, :refresh_node_info, [cardano_sl_mainnet_production_node_id]}
    ],
    refresh_mainnet_production_node_info: [
      # Runs every 5 seconds
      schedule: {:extended, "*/5"},
      task: {CardanoSL, :refresh_node_info, [cardano_sl_mainnet_production_node_id]}
    ]
  ]

import_config "#{Mix.env()}.exs"
