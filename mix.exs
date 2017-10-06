defmodule NoSlides.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ring,
      version: "0.1.0",
      elixir: "~> 1.3",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      applications: [:riak_core, :logger ],
      mod: {Ring, []}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:riak_core, "~> 3.0", hex: :riak_core_ng, manager: :rebar3},
      {:cuttlefish, "~> 2.0.7", manager: :rebar},
    ]
  end
end
