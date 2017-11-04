# my_template: a mix template for my projects

## New Project Template

        mix gen my_template «name» [ --into «path» ] [--sup[ervisor]] [--app[lication] «app»] [--module «module»]

## Install

This template is installed using the `template.install` mix task.
Projects are generated from it using the `mix gen` task.

So, before using templates for the first time, you need to install these two tasks:

    $ mix archive.install mix_templates
    $ mix archive.install mix_generator

Then you can install this template using

    $ mix template.install github sunny-g/my_template


## Use

To create a basic project, with no supervision and no application, run:

~~~
$ mix gen my_template «project_name»
~~~

`«project_name»` is both the name of the subdirectory that will hold the
project and the name that will be given to the application. This
affects entries in `mix.exs` as well as the names of the main
file in `lib/` and the skeleton test in `test/`. The application
module name will be the camelcase version of «name».

By default the subdirectory will be created under your
current directory; you can change this with the `--into` option:

~~~
$ mix gen my_template «project_name» --into some/other/dir
~~~

### Variants

To create a project with a top-level supervisor contained in an
application callback, use the `--sup` (or `--supervisor`) option.

~~~
$ mix gen my_template «project_name» --sup
~~~

The application's `start` function is created in
`lib/«name»/application.ex`, along with a basic supervisor.

You can change the name used for the application:

~~~
$ mix gen my_template «project_name» --app[lication] «app»
~~~

The original «project_name» parameter will be the
name used for the directory, and «app» will be used when
creating file names in that directory and when customizing the
file contents.

Finally, you can override the name used for the application module:


~~~
$ mix gen my_template «project_name» --module «Module»
~~~

«Module» must be a valid Elixir module name or alias.

~~~
