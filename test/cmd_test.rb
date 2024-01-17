require_relative "setup"

class CmdTest < Test::Unit::TestCase
  class Command < Cmd
    set_banner usage: "test [OPTIONS]",
               description: "..."
    set_option '-f', '--foo', 'An option without an argument'
    set_option '-b=ARG', '--bar=ARG', 'An option with an argument'

    def run
      parse_options(argv)
    end
  end

  def test_foo_yes
    options = Command.new(['-f']).run
    assert_equal true, options.f
    assert_equal true, options.foo
  end

  def test_foo_no
    options = Command.new([]).run
    assert_equal nil, options.f
    assert_equal nil, options.foo
  end

  def test_bar
    options = Command.new(['-b', 'foobar']).run
    assert_equal 'foobar', options.b
    assert_equal 'foobar', options.bar
  end
end
