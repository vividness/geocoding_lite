module Geocode
  class Geocode
    def initialize
      @location = Location.new
      @image    = Image.new
      @link     = Link.new
    end
    
    def image_options
      @image.instance_eval(&Proc.new) if block_given?
    end
    
    def link_options
      @link = Link.new
      @link.instance_eval(&Proc.new) if block_given?
    end
    
    def lookup(address)
      response = GoogleGeocodingAPI.lookup(address)
      
      @location.address = response[:address]
      @location.lat     = response[:lat]
      @location.lng     = response[:lng]
      @location.types   = response[:types]
      @location.image   = @image.url(@location)
      @location.link    = @link.url(@location)
      
      @location
    end
  end
end