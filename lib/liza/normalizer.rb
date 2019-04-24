require "http"

module Liza
  class Normalizer
    BASE_URL = "https://servicios.usig.buenosaires.gob.ar/normalizar"

    attr_reader :address

    def initialize(address)
      @address = address
    end

    def suggestions
      results.map(&:normalized_address)
    end

    def results
      fetch.map(&Address.method(:new))
    end

    private

    def fetch
      response = HTTP.get(BASE_URL, params: { direccion: address })
      json = JSON.parse(response)
      json["direccionesNormalizadas"]
    rescue HTTP::ConnectionError
      raise ConnectionError
    end
  end
end
