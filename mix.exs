defmodule EchonestEx.Mixfile do
  use Mix.Project

  @description """
    Echonest api wrapper for Elixir
  """

  def project do
    [ app: :echonest_ex,
      version: "0.0.1",
      elixir: "~> 1.1",
      name: "EchonestEx",
      description: @description,
      deps: deps,
      package: package,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test]
    ]
  end

  def application do
    [applications: [:httpoison]]
  end

  defp deps do
    [
      { :httpoison, "~> 0.8.0" },
      { :poison, "~> 2.0" },
      { :excoveralls, "~> 0.4", only: :test },
      { :exvcr, "~> 0.7",       only: :test }
    ]
  end

  defp package do
    [
      maintainers: ["Gregorio Setti"],
      licenses: ["MIT"],
      links: %{ "Github" => "https://github.com/desmondhume/echonest_ex" }
    ]
  end

end
