module GeocodingLite
  class Geocode
    def initialize(service = nil)
      @service  = service  || GeocodingService.new
    end
    
    def lookup(location)
      @service.lookup(location)
    end
  end
end
