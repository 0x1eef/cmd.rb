# frozen_string_literal: true

class Cmd
  require_relative "cmd/mixin"

  include Mixin::ARGV
  include Mixin::Help

  def self.inherited(klass)
    klass.class_eval do
      include Mixin::OptionParser
      prepend Module.new {
        def run(...)
          options = parse_options(argv)
          options.help ? show_help : super(...)
        end
      }
    end
  end
end
