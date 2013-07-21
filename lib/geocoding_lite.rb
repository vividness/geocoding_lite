require 'geocoding_lite/geocode'
require 'geocoding_lite/geocoding_service'
require 'geocoding_lite/core_extensions'
require 'geocoding_lite/version'

module GeocodingLite
  def self.lookup(address)
    @geocode ||= Geocode.new
    @geocode.lookup(address)
  end
end
