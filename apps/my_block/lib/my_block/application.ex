defmodule MyBlock.Application do
  @moduledoc """
  The MyBlock Application Service.

  The my_block system business domain lives in this application.

  Exposes API to clients such as the `MyBlockWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link(
      [
        supervisor(MyBlock.Repo, [])
      ],
      strategy: :one_for_one,
      name: MyBlock.Supervisor
    )
  end
end
