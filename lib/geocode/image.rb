module Geocode
  class Image
    MAPS_API = %q(http://maps.googleapis.com/maps/api/staticmap?sensor=false&)
    
    attr_writer :width, :height, :zoom, :scale, :maptype, :sensor
    
    def initialize 
      @width   = 300
      @height  = 300
      @scale   = 1
      @maptype = :roadmap
      @sensor  = false
      @zoom    = 10
    end
    
    def url(location)
      @lat   = location.lat
      @lng   = location.lng
      @types = location.types
      
      "#{MAPS_API}#{[size, zoom, scale, maptype, center].join('&')}"
    end
    
    def center
      "center=#{@lat},#{@lng}"
    end
    
    def size
      "size=#{@width}x#{@height}"
    end
    
    def zoom
      "zoom=#{@zoom}"
    end
    
    def scale
      "scale=#{@scale}"
    end
    
    def maptype
      "maptype=#{@maptype}"
    end
  end
end