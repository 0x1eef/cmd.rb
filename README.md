## About

cmd.rb is a library for building command-line applications
in Ruby. The interface is centered around a class that implements
a command (or it could be a sub-command) that defines a banner,
a set of options, and a set of defaults for those options. The
option parsing implementation is delegated to
[ruby/optparse](https://github.com/ruby/optparse)
for the most part, with a few minor enhancements.

## Examples

### Basic command

The following example demonstrates a basic "ls" command that is
implemented with `Dir.entries`:

```ruby
#!/usr/bin/env ruby

class Ls
  require "cmd"
  include Cmd

  set_banner usage: "ls [OPTIONS]",
             description: "Lists the contents of a directory"
  set_option "-g PATTERN", "--grep PATTERN", "A regular expression", as: Regexp
  set_option "-p PATH", "--path PATH", "The target path", as: String
  set_default grep: /.+/, path: "/"

  def run
    options = parse!(argv)
    options.help ? show_help : run_command(options)
  end

  private

  def run_command(options)
    puts Dir.entries(options.path)
            .grep(options.grep)
            .sort
            .join("\n")
  end
end

##
# Run the command
Ls.new(ARGV).run
```

When we run `./ls --help`:

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

And when we run `./ls --path / --grep e`:

```
$ ./ls --path / --grep e
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
gem "cmd.rb", github: "0x1eef/cmd.rb", tag: "v0.1.0"
gem "ryo.rb", github: "0x1eef/ryo.rb"
```

## <a id="license"> License </a>

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/).
<br>
See [LICENSE](./LICENSE).
