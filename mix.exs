defmodule MyTemplate.Mixfile do
  use Mix.Project

  @name    :my_template
  @version "0.1.0"

  @deps [
    {:mix_templates,  ">0.0.0", app: false},
    {:ex_doc,         ">0.0.0", only: [:dev, :test]},
  ]

  @maintainers ["Sunny G"]
  @github      "https://github.com/sunny-g/my_template"

  @description """
  My template for Elixir projects
  """

  # ------------------------------------------------------------

  def project do
    in_production = Mix.env == :prod
    [
      app:              @name,
      version:          @version,
      deps:             @deps,
      elixir:           "~> 1.4",
      package:          package(),
      description:      @description,
      build_embedded:   in_production,
      start_permanent:  in_production,
    ]
  end

  defp package do
    [
      name:        @name,
      files:       ["lib", "mix.exs", "README.md", "template"],
      maintainers: @maintainers,
      licenses:    ["Apache 2.0"],
      links:       %{
        "GitHub" => @github,
      },
    ]
  end
end
