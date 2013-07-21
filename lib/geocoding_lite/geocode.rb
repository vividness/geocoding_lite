module GeocodingLite
  class Geocoding
    def initialize(service = nil)
      @service  = service  || GeocodingService.new
    end
    
    def lookup(address)
      @service.lookup(address)
    end
  end
end
