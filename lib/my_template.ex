defmodule MyTemplate do

  @moduledoc File.read!(Path.join([__DIR__, "../README.md"]))

  use MixTemplates,
    name:       :my_template,
    short_desc: "Template for sunny-g's Elixir projects",
    source_dir: "../template",
    # based on gen_template_project, but since files are overwritten and not extended, we've reproduced all desired functionality here and in mix.exs

    options: [
      sup: [
        to:         :is_supervisor?,
        default:    false,
        desc:       "creates a top-level supervisor, and adds the app to mix.exs",
      ],
      supervisor:   [ same_as: :sup ],

      app: [
        to:         :app,
        required:   false,
        takes:      "app_name",
        desc:       "sets the application name to «app_name»",
      ],
      application:  [ same_as: :app ],

      module: [
        to:         :project_name_camel_case,
        required:   false,
        takes:      "«project_name»",
        desc:       "sets the name of the module to «project_name»",
      ],
    ]

end
