module GeocodingLite
  class Geocode
    def initialize(location = nil, service = nil)
      @location = location || Location.new
      @service  = service  || GeocodingService.new
    end
    
    def lookup(address)
      @service.lookup(address, @location)
    end
  end
end
