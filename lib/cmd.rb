# frozen_string_literal: true

class Cmd
  require_relative "cmd/mixins/option_parser"
  include Cmd::OptionParser
  attr_reader :argv

  def initialize(argv)
    @argv = argv
  end
end
