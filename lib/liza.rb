require "liza/address"
require "liza/normalizer"
require "liza/version"

module Liza
  Error = Class.new(StandardError)
  ConnectionError = Class.new(Error)

  extend self

  def normalize(address)
    Normalizer.new(address)
  end
end
