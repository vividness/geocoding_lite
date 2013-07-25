require 'geocoding_lite/geocode'
require 'geocoding_lite/geocoding_service'
require 'geocoding_lite/core_extensions'
require 'geocoding_lite/version'

module GeocodingLite
  def self.lookup(location)
    @geocode ||= Geocode.new
    @geocode.lookup(location)
  end
end
