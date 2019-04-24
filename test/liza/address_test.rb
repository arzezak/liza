require "test_helper"

module Liza
  class AddressTest < Minitest::Test
    include Support::Recordable

    use_vcr_fixture :address

    def test_that_it_has_no_number
      assert_nil example.number
    end

    def test_that_it_has_coordinates
      assert_equal [-34.562037, -58.456695], example.coordinates
    end

    def test_that_it_has_a_normalized_address
      assert_equal "CABILDO AV. y JURAMENTO, CABA", example.normalized_address
    end

    def test_that_it_has_a_street
      assert_equal "CABILDO AV.", example.street
    end

    def test_that_it_has_a_crossing_street
      assert_equal "JURAMENTO", example.crossing_street
    end

    def test_that_it_has_a_locality
      assert_equal "CABA", example.locality
    end

    def test_that_it_has_an_area
      assert_equal "CABA", example.area
    end

    def test_that_it_has_a_map_url
      url = "https://www.google.com/maps/search/-34.562037,-58.456695"
      assert_equal url, example.map_url
    end

    private

    def example
      liza = Normalizer.new("Cabildo y Juramento")
      liza.first
    end
  end
end
