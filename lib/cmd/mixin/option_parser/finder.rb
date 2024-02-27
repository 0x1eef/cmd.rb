module Cmd::Mixin::OptionParser
  module Finder
    extend self
    ##
    # @param [CLI::OptionParser] option_parser
    #  An instance of CLI::OptionParser.
    #
    # @param [String] short
    #  Short option.
    #
    # @param [String] long
    #  Long option.
    #
    # @return [CLI::OptionParser::Switch, nil]
    #  Returns a Switch, or nil.
    def find(option_parser, short:, long:)
      option_parser.top.list.find do |s|
        s.short[0] == short[/[^\s]*/] &&
        s.long[0] == long[/[^\s*]*/]
      end
    end
  end
end
