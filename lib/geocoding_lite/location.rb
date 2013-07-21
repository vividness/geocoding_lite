module GeocodingLite
  class Location
    attr_accessor :address, :latitude, :longitude
    
    def map_response!(response)
      @location.address   = response[:address]
      @location.latitude  = response[:latitude]
      @location.longitude = response[:longitude]
    end
  end
end
