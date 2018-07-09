defmodule <%= @project_name_camel_case %>.Mixfile do
  use Mix.Project

  @name         :<%= @project_name %>
  @version      "0.0.1-dev"
  @description  """
  """
  @github       "https://github.com/sunny-g/<%= @project_name %>"
  @files        ["lib", "mix.exs", "README.md"]
  @maintainers  ["Sunny G"]
  @licenses     ["MIT"]

  # ------------------------------------------------------------

  def project do
    in_production = Mix.env == :prod

    [ app:              @name,
      version:          @version,
      description:      @description,
      elixir:           "~> 1.6",
      docs:             docs(),
      package:          package(),
<%= if @in_umbrella? do %>
      build_path:       "../../_build",
      config_path:      "../../config/config.exs",
      deps_path:        "../../deps",
      lockfile:         "../../mix.lock",
      start_permanent:  in_production,
<% else %>
      deps:             deps() ++ dev_deps(),
      build_embedded:   in_production,
      start_permanent:  in_production,
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

  defp deps() do
    [
    ]
  end

  defp dev_deps() do
    [ {:credo,          "~> 0.9",   only: [:dev, :test], runtime: false},
      {:ex_doc,         "~> 0.18",  only: [:dev, :test], runtime: false},
      {:mix_test_watch, "~> 0.6",   only: [:dev, :test], runtime: false},
    ]
  end

  defp package do
    [ name:        @name,
      files:       @files,
      maintainers: @maintainers,
      licenses:    @licenses,
      links:       %{
        "GitHub" => @github,
      },
    ]
  end

  defp docs do
    [ main:       "readme",
      source_url: @github,
      extras:     ["README.md"],
    ]
  end
end
