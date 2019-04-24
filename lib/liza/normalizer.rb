require "http"

module Liza
  class Normalizer
    include Enumerable

    BASE_URL = "https://servicios.usig.buenosaires.gob.ar/normalizar"

    attr_reader :address, :results

    def initialize(address)
      @address = address
      @results = fetch.map { |item| Address.new(item) }
    end

    def each(&block)
      results.each(&block)
    end

    def suggestions
      results.map(&:to_s)
    end

    private

    def fetch
      response = HTTP.get(BASE_URL, params: params)
      json = JSON.parse(response)
      json["direccionesNormalizadas"]
    rescue HTTP::ConnectionError
      raise ConnectionError
    end

    def params
      { direccion: address, geocodificar: true }
    end
  end
end
