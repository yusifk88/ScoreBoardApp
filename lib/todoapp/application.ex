defmodule Todoapp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      TodoappWeb.Telemetry,
      # Start the Ecto repository
      Todoapp.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Todoapp.PubSub},
      # Start Finch
      {Finch, name: Todoapp.Finch},
      # Start the Endpoint (http/https)
      TodoappWeb.Endpoint
      # Start a worker by calling: Todoapp.Worker.start_link(arg)
      # {Todoapp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Todoapp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TodoappWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
