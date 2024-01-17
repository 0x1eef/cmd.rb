# frozen_string_literal: true

##
# The {Cmd::Mixin::ARGV Cmd::Mixin::ARGV} module provides
# an initialize method, and an attribute reader for an
# array of strings (usually ARGV).
module Cmd::Mixin::ARGV
  ##
  # @return [Array<String>]
  #  Returns an array of strings.
  attr_reader :argv

  ##
  # @param [Array<String>] argv
  #  An array of strings.
  def initialize(argv)
    @argv = argv.dup
  end
end
