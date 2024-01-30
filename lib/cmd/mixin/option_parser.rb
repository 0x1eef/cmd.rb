# frozen_string_literal: true

##
# The {Cmd::Mixin::OptionParser Cmd::Mixin::OptionParser} module enhances
# the functionality of Ruby's
# [OptionParser](https://docs.ruby-lang.org/en/3.2/OptionParser.html)
# class.
module Cmd::Mixin::OptionParser
  require "cli-option_parser"
  require "ryo"

  def self.included(klass)
    klass.extend(ClassMethods)
  end

  module ClassMethods
    ##
    # Set command banner.
    #
    # @param [String] usage
    #  An example of how a command is used.
    #
    # @param [String] description
    #  The description of a command.
    #
    # @return [void]
    def set_banner(usage:, description:)
      banner.usage = usage
      banner.description = description
    end

    ##
    # Set a command option.
    #
    # @param [String] short
    #  Short option switch.
    #
    # @param [String] long
    #  Long option switch.
    #
    # @param [String] desc
    #  The description of an option.
    #
    # @param [Class] as
    #  The type (String, Integer, etc) of the option's value.
    #
    # @param [Object] default
    #  The default value for an option.
    #
    # @return [void]
    def set_option(short, long, desc, as: String, default: nil)
      option_parser.on(short, long, desc, as) { _1 || true }
      set_default({ short => default, long => default })
    end

    ##
    # Set command option defaults.
    #
    # @param [{String => Object}] defaults
    #
    # @return [void]
    def set_default(defaults)
      @defaults = Ryo.from(defaults)
    end

    ##
    # (see Cmd::Mixin::OptionParser#option_parser)
    def option_parser
      @option_parser ||= CLI::OptionParser.new(nil, 26, " " * 2).tap do
        _1.banner = ""
        _1.on("-h", "--help", "Show help")
      end
    end

    ##
    # @private
    def banner
      @banner ||= Ryo({})
    end

    ##
    # @private
    def defaults
      @defaults ||= Ryo({})
    end
  end

  ##
  # Parses an array of strings with
  # [OptionParser#parse](https://docs.ruby-lang.org/en/3.2/OptionParser.html#method-i-parse).
  #

  # @param [Array<String>] argv
  #  An array of strings
  #
  # @return [Ryo::Object]
  #  Returns the parsed options as a Ryo object
  def parse_options(argv)
    options = Ryo.from(self.class.defaults)
    option_parser.parse(argv, into: options)
    options
  end

  ##
  # Parses an array of strings with
  # [OptionParser#parse!](https://docs.ruby-lang.org/en/3.2/OptionParser.html#method-i-parse-21).
  #
  # @param [Array<String>] argv
  #  An array of strings
  #
  # @return [Ryo::Object]
  #  Returns the parsed options as a Ryo object
  def parse_options!(argv)
    options = Ryo.from(self.class.defaults)
    option_parser.parse!(argv, into: options)
    options
  end

  ##
  # @return [OptionParser]
  #  Returns an instance of
  #  [OptionParser](https://docs.ruby-lang.org/en/3.2/OptionParser.html)
  def option_parser
    self.class.option_parser
  end
end
