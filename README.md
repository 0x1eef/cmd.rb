## About

cmd.rb is a library for building command-line applications
in Ruby. The interface is centered around a class that implements
a command (or it could be a sub-command) that defines a banner,
a set of options, and a set of defaults for those options. The
option parsing implementation is delegated to
[ruby/optparse](https://github.com/ruby/optparse)
(with a few minor enhancements).

## Example

The following example demonstrates a simple command that is
implemented with `Dir.entries`. The command accepts two options
that are assigned default values for when the command is executed
with no arguments:

```ruby
#!/usr/bin/env ruby

class Ls
  require "cmd"
  include Cmd

  set_banner usage: "ls [OPTIONS]",
             description: "Lists the contents of a directory"
  set_option "-g PATTERN", "--grep PATTERN", "A regular expression", as: Regexp
  set_option "-d PATH", "--directory PATH", "A path to a directory", as: String
  set_default grep: /.+/, path: "/"

  def run
    options = parse_options(argv)
    options.help ? show_help : run_command(options)
  end

  private

  def run_command(options)
    puts Dir.entries(options.directory)
            .grep(options.grep)
            .sort
            .join("\n")
  end
end

##
# Run the command
Ls.new(ARGV).run
```

When `./ls --help` is executed:

```
$ chmod u+x ls
$ ./ls --help
Usage: ls [OPTIONS]

Description:
  Lists the contents of a directory

Options:
  -g, --grep PATTERN         A regular expression
  -p, --path PATH            The target path
  -h, --help                 Show help

```

When `./ls --directory / --grep e` is executed:

```
$ ./ls --directory / --grep e
dev
etc
home
```

## Sources

* [Source code (GitHub)](https://github.com/0x1eef/cmd.rb#readme)
* [Source code (GitLab)](https://gitlab.com/0x1eef/cmd.rb#about)

## Install

cmd.rb is distributed as a RubyGem through its git repositories. <br>
[GitHub](https://github.com/0x1eef/cmd.rb),
and
[GitLab](https://gitlab.com/0x1eef/cmd.rb)
are available as sources.

**Gemfile**

```ruby
gem "cmd.rb", github: "0x1eef/cmd.rb", tag: "v0.2.1"
gem "ryo.rb", github: "0x1eef/ryo.rb"
```

## <a id="license"> License </a>

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/).
<br>
See [LICENSE](./LICENSE).
