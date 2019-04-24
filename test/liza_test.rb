require "test_helper"

class LizaTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Liza::VERSION
  end

  def test_that_normalize_requires_an_argument
    assert_raises(ArgumentError) { Liza.normalize }
  end
end
