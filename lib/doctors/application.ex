defmodule Doctors.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      DoctorsWeb.Telemetry,
      # Start the Ecto repository
      Doctors.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Doctors.PubSub},
      # Start Finch
      {Finch, name: Doctors.Finch},
      # Start the Endpoint (http/https)
      DoctorsWeb.Endpoint
      # Start a worker by calling: Doctors.Worker.start_link(arg)
      # {Doctors.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Doctors.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DoctorsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
