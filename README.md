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
that have fallback default values set:

**Definition**

```ruby
#!/usr/bin/env ruby

require "cmd"
class Ls < Cmd
  set_banner usage: "ls [OPTIONS]",
             description: "Lists the contents of a directory"
  set_option "-g PATTERN", "--grep PATTERN", "A regular expression", as: Regexp, default: /.+/
  set_option "-d PATH", "--directory PATH", "A path to a directory", as: String, default: Dir.home

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

**Command help (-h)**

```
$ chmod u+x ls
$ ./ls --help
Usage: ls [OPTIONS]

Description:
  Lists the contents of a directory

Options:
  -g, --grep PATTERN         A regular expression
  -p, --path PATH            A path to a directory
  -h, --help                 Show help

```

## Sources

* [Source code (GitHub)](https://github.com/0x1eef/cmd.rb#readme)
* [Source code (GitLab)](https://gitlab.com/0x1eef/cmd.rb#about)

## Install

**Git**

cmd.rb is distributed as a RubyGem through its git repositories. <br>
[GitHub](https://github.com/0x1eef/cmd.rb),
and
[GitLab](https://gitlab.com/0x1eef/cmd.rb)
are available as sources.

```ruby
# Gemfile
gem "cmd.rb", github: "0x1eef/cmd.rb", tag: "v0.4.0"
```

**Rubygems.org**

cmd.rb can also be installed via rubygems.org.

    gem install cmd.rb

## <a id="license"> License </a>

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/).
<br>
See [LICENSE](./LICENSE).
