module Liza
  class Address
    attr_reader :number, :coordinates, :normalized_address, :street,
      :crossing_street, :locality, :area

    def initialize(arguments)
      @number = arguments["altura"]
      @coordinates = parse_coords(arguments["coordenadas"])
      @normalized_address = arguments["direccion"]
      @street = arguments["nombre_calle"]
      @crossing_street = arguments["nombre_calle_cruce"]
      @locality = arguments["nombre_localidad"]
      @area = arguments["nombre_partido"]
    end

    def to_s
      normalized_address
    end

    def map_url
      "https://www.google.com/maps/search/#{coordinates.join(',')}"
    end

    private

    def parse_coords(arguments)
      arguments.values_at("y", "x").map(&:to_f)
    end
  end
end
