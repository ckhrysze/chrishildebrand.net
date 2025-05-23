defmodule Ckhrysze.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      CkhryszeWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Ckhrysze.PubSub},
      # Start Finch
      {Finch, name: Ckhrysze.Finch},
      # Start the Endpoint (http/https)
      CkhryszeWeb.Endpoint,
      # Start a worker by calling: Ckhrysze.Worker.start_link(arg)
      # {Ckhrysze.Worker, arg}
      {Cachex, name: :torchlight_cache}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ckhrysze.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CkhryszeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
