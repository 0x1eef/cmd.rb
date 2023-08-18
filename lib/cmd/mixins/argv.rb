module Cmd::ARGV
  attr_reader :argv
  def initialize(argv)
    @argv = argv
  end
end
