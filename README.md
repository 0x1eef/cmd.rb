## About

cmd.rb is a library for building command-line applications
in Ruby. The interface is centered around a class that implements
a command (or it could be a sub-command) that defines a banner,
a set of options, and a set of defaults for those options. At
the moment cmd.rb is not mature, and it has been quickly extracted
from one project to allow me easily re-use it in another.

## Examples

### An "ls" command

The following example demonstrates an "ls" command. It is much
less powerful than `/bin/ls`, and only serves to illustrate how
cmd.rb works in practice:

```ruby
# lib/ls.rb
require "cmd"
class Ls < Cmd
  set_banner usage: "ls [OPTIONS]",
             description: "Lists the contents of a directory"
  set_option "-g PATTERN", "--grep PATTERN", "A regular expression", Regexp
  set_option "-p PATH", "--path PATH", "The target path"
  set_default grep: /.+/, path: "/"

  def run
    options = parse(argv)
    options.help ? show_help : run_command(options)
  end

  private

  def run_command(options)
    puts %x(ls -1 #{options.path})
          .each_line
          .grep(options.grep)
          .join("\n")
  end
end

##
# Run the command
Ls.new(ARGV).run
```

When we run `ruby lib/ls.rb --help`, the following output is produced:

```
Usage: ls [OPTIONS]

Description:
  Lists the contents of a directory

Options:
  -g, --grep PATTERN         A regular expression
  -p, --path PATH            The target path
  -h, --help                 Show help

```

And when we run `ruby lib/ls.rb --path / --grep e`, the directories
`dev`, `etc`, and `home` are written to standard output on a UNIX-like
operating system.

## Install

TODO: add instructions

## <a id="license"> License </a>

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/).
<br>
See [LICENSE](./LICENSE).
