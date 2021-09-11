# SPDX-FileCopyrightText: 2021 Rosa Richter
#
# SPDX-License-Identifier: MIT

defmodule SpdxCli.MixProject do
  use Mix.Project

  def project do
    [
      app: :spdx_cli,
      description: "A CLI for the SPDX License List",
      version: "1.2.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      escript: [
        name: "spdx",
        main_module: SpdxCli
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      maintainers: ["Rosa Richter"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/Cantido/spdx_cli",
        "sourcehut" => "https://sr.ht/~cosmicrose/spdx_cli",
        "Sponsor" => "https://liberapay.com/rosa"
      }
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:httpoison, "~> 1.8"},
      {:nimble_csv, "~> 1.1"},
      {:optimus, "~> 0.2"},
      {:poison, "~> 5.0"},
      {:ex_doc, "~> 0.25", only: [:dev], runtime: false},
      {:credo, "~> 1.5.0-rc.2", only: [:dev, :test], runtime: false}
    ]
  end
end
