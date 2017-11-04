defmodule <%= @project_name_camel_case %>.Mixfile do
  use Mix.Project

  @name    :<%= @project_name %>
  @version "0.0.1"

  @deps [
  ]

  @dev_deps [
    {:credo,          "~> 0.8", only: [:dev, :test], runtime: false},
    {:ex_doc,         ">0.0.0", only: [:dev, :test], runtime: false},
    {:mix_test_watch, "~> 0.3", only: [:dev, :test], runtime: false},
  ]

  @maintainers ["Sunny G"]
  @github      "https://github.com/sunny-g/<%= @project_name %>"

  @description """

  """

  # ------------------------------------------------------------

  def project do
    in_production = Mix.env == :prod

    [ app:              @name,
      version:          @version,
      elixir:           "~> 1.4",
<%= if @in_umbrella? do %>
      build_path:      "../../_build",
      config_path:     "../../config/config.exs",
      deps_path:       "../../deps",
      lockfile:        "../../mix.lock",
      start_permanent: in_production,
<% else %>
      deps:             @deps ++ @dev_deps,
      build_embedded:   in_production,
      start_permanent:  in_production,
      description:      @description,
      docs: [
        main:           "readme",
        source_url:     @github,
        extras:         ["README.md"],
      ],
      package:          package(),
<% end %>
    ]
  end

  def application do
      # built-in apps that need starting
    [ extra_applications: [
        :logger,
      ],
<%= if @is_supervisor? do %>
      # Entry point module and parameters
      mod: {<%= @project_name_camel_case %>.Application, []},
<% end %>
    ]
    end

  defp package do
    [ name:        @name,
      files:       ["lib", "mix.exs", "README.md"],
      maintainers: @maintainers,
      licenses:    ["MIT"],
      links:       %{
        "GitHub" => @github,
      },
    ]
  end
end
