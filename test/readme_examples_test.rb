# frozen_string_literal: true

require_relative "setup"

class READMETest < Test::Unit::TestCase
  include Test::Cmd

  def test_ls_command
    assert_equal "dev\netc\nhome\n",
                 run_example("ls --path test/fakefs/ --grep [^.gitkeep]").stdout
  end

  def test_ls_command_help
    help = "Usage: ls [OPTIONS]\n\n" \
           "Description:\n" \
           "  Lists the contents of a directory\n\n" \
           "Options: \n" \
           "  -h, --help                 Show help\n" \
           "  -g, --grep PATTERN         A regular expression\n" \
           "  -p, --path PATH            The target path\n\n"
    assert_equal help, run_example("ls --help").stdout
  end

  private

  def run_example(command)
    cmd File.join(__dir__, "..", "share", "examples", "cmd.rb", command)
  end
end
