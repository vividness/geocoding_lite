module GeocodingLite
  class Geocode
    def initialize(location = nil, api = nil)
      @location = location || Location.new
      @api      = api || GoogleGeocodingAPI
    end
    
    def lookup(address)
      response = @api.lookup(address)
      
      @location.address   = response[:address]
      @location.latitude  = response[:latitude]
      @location.longitude = response[:longitude]
      @location.types     = response[:types]
      
      @location
    end
  end
end
