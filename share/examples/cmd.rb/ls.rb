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
