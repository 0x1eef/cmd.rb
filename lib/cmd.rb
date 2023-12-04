# frozen_string_literal: true

class Cmd
  require_relative "cmd/mixins/argv"
  require_relative "cmd/mixins/help"
  require_relative "cmd/mixins/option_parser"

  include ARGV
  include Help

  def self.inherited(klass)
    klass.class_eval { include(OptionParser) }
  end
end
