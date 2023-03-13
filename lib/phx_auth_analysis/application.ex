defmodule PhxAuthAnalysis.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PhxAuthAnalysisWeb.Telemetry,
      # Start the Ecto repository
      PhxAuthAnalysis.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhxAuthAnalysis.PubSub},
      # Start Finch
      {Finch, name: PhxAuthAnalysis.Finch},
      # Start the Endpoint (http/https)
      PhxAuthAnalysisWeb.Endpoint
      # Start a worker by calling: PhxAuthAnalysis.Worker.start_link(arg)
      # {PhxAuthAnalysis.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhxAuthAnalysis.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhxAuthAnalysisWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
