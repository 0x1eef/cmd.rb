# frozen_string_literal: true

class Cmd
  require_relative "cmd/mixin"

  include Mixin::ARGV
  include Mixin::Help

  def self.inherited(klass)
    klass.class_eval { include(Mixin::OptionParser) }
  end
end
