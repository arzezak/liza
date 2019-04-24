module Liza
  class Address
    attr_reader :number, :normalized_address, :street, :crossing_street,
      :locality, :area

    def initialize(arguments)
      @number = arguments["altura"]
      @normalized_address = arguments["direccion"]
      @street = arguments["nombre_calle"]
      @crossing_street = arguments["nombre_calle_cruce"]
      @locality = arguments["nombre_localidad"]
      @area = arguments["nombre_partido"]
    end

    def to_s
      normalized_address
    end
  end
end
