# frozen_string_literal: true

module Cmd::ARGV
  attr_reader :argv
  def initialize(argv)
    @argv = argv.dup
  end
end
