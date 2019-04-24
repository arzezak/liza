require "test_helper"

module Liza
  class NormalizerTest < Minitest::Test
    include Support::Recordable

    use_vcr_fixture :normalizer

    def test_that_it_returns_an_array_of_suggestions
      assert_includes example.suggestions, "DEL LIBERTADOR AV. y LA PAMPA, CABA"
    end

    private

    def example
      Normalizer.new("Libertador y Pampa")
    end
  end
end
