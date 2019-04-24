require "http"
require "json"

module Liza
  class Normalizer
    include Enumerable

    BASE_URL = "https://servicios.usig.buenosaires.gob.ar/normalizar".freeze

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
      parse_json HTTP.get(BASE_URL, params: { direccion: address, geocodificar: true })
    rescue HTTP::ConnectionError
      raise ConnectionError
    end

    def parse_json(response)
      json = JSON.parse(response)
      json["direccionesNormalizadas"]
    end
  end
end
