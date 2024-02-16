require_relative "setup"

class CmdTest < Test::Unit::TestCase
  class Command < Cmd
    set_banner usage: "test [OPTIONS]",
               description: "A test program"
    set_option '-x', '--xarg', 'An option without an argument'
    set_option '-y ARG', '--yarg ARG', 'An option with a required argument'
    set_option '-z [ARG]', '--zarg [ARG]', 'An option with an optional argument'

    def run
      parse_options(argv)
    end
  end

  def test_none_given
    options = Command.new([]).run
    [options.x, options.xarg,
     options.y, options.yarg,
     options.z, options.zarg].each do
      assert_equal nil, _1
    end
  end

  ##
  # No argument option
  # -x, --xarg

  def test_xarg_given
    options = Command.new(['-x']).run
    assert_equal true, options.x
    assert_equal true, options.xarg
  end

  ##
  # Required argument option
  # -y ARG, --yarg ARG

  def test_yarg_given
    options = Command.new(['-y', 'required-argument']).run
    assert_equal 'required-argument', options.y
    assert_equal 'required-argument', options.yarg
  end

  def test_yarg_missing_argument
    assert_raises(CLI::OptionParser::MissingArgument) do
      Command.new(['-y']).run
    end
  end

  ##
  # Optional argument option
  # -z [ARG], --zarg [ARG]

  def test_zarg_given
    options = Command.new(['-z', 'optional-argument']).run
    assert_equal 'optional-argument', options.z
    assert_equal 'optional-argument', options.zarg
  end

  def test_zarg_missing_argument
    options = Command.new(['-z']).run
    assert_equal nil, options.z
    assert_equal nil, options.zarg
  end
end
