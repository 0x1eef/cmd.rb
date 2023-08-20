
module Cmd::Help
  def show_help(io = $stdout)
    banner = self.class.banner
    io.puts "Usage: #{banner.usage}\n\n" \
            "Description:\n  #{banner.description}\n\n" \
            "Options: #{option_parser.help}\n"
  end
end
