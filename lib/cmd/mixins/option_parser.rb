# frozen_string_literal: true

require "optparse"
require "ryo"

module Cmd::OptionParser
  def self.included(klass)
    klass.extend(ClassMethods)
  end

  module ClassMethods
    def set_banner(usage:, description:)
      banner.usage = usage
      banner.description = description
    end

    def set_option(short, long, desc, as: String)
      option_parser.on(short, long, desc, as)
    end

    def set_default(defaults)
      @defaults = Ryo.from(defaults)
    end

    def option_parser
      @option_parser ||= ::OptionParser.new(nil, 26, " " * 2).tap do
        _1.banner = ""
        _1.on("-h", "--help", "Show help")
      end
    end

    def banner
      @banner ||= Ryo({})
    end

    def defaults
      @defaults || {}
    end
  end

  def parse_options(argv)
    options = Ryo.from(self.class.defaults)
    option_parser.parse(argv, into: options)
    options
  end

  def parse_options!(argv)
    options = Ryo.from(self.class.defaults)
    option_parser.parse!(argv, into: options)
    options
  end

  def option_parser
    self.class.option_parser
  end
end
