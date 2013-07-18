require 'geocoding_lite/geocode'
require 'geocoding_lite/location'
require 'geocoding_lite/image'
require 'geocoding_lite/google_geocoding_api'
require 'geocoding_lite/core_extensions'
require 'geocoding_lite/version'

module GeocodingLite
  def self.lookup(name)
    @geocode ||= Geocode.new
    @geocode.lookup(name)
  end
end
