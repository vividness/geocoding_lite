module GeocodingLite
  class Image
    MAPS_API = %q(http://maps.googleapis.com/maps/api/staticmap?sensor=false&)
    
    def initialize(location)
      @latitude  = location.latitude
      @longitude = location.longitude
      @types     = location.types
    end
    
    def src(args = {})
      @width     = args[:width]   || 640
      @height    = args[:height]  || 480
      @scale     = args[:scale]   || 1
      @maptype   = args[:maptype] || :roadmap
      @zoom      = args[:zoom]    || zoom_level(@types)
      
      "#{MAPS_API}#{[size, zoom, scale, maptype, center].join('&')}"
    end

    private 

    def zoom_level(types = [])
      case
      when types.include?('street_address')
        15
      when types.include?('country')
        5
      when types.include?('locality')
        8
      when types.include?('postal_code')
        12
      when types.include?('point_of_interest')
        15
      when types.include?('natural_feature')
        3
      when types.include?('park')
        12
      else 
        9
      end
    end

    def center
      "center=#{@latitude},#{@longitude}"
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
