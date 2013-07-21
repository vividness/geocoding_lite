module GeocodingLite
  class Geocode
    def initialize(location = nil, service = nil)
      @location = location || Location.new
      @service  = service  || GeocodingService.new
    end
    
    def lookup(address)
      response = @service.lookup(address)
      
      @location.map_response!(response)
      @location
    end
  end
end
