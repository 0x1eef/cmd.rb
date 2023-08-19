# frozen_string_literal: true

require_relative "setup"

class READMETest < Test::Unit::TestCase
  include Test::Cmd

  def test_ls_command
    assert_equal "dev\netc\nhome\n",
                 run_example("ls --path test/fakefs/ --grep e").stdout
  end

  private

  def run_example(command)
    cmd File.join(__dir__, "..", "share", "examples", "cmd.rb", command)
  end
end
