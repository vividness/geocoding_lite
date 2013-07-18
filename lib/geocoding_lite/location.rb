module GeocodingLite
  class Location
    attr_accessor :address, :types, :latitude 
    attr_accessor :longitude, :image, :zoom

    def image(args = {})
      @image = Image.new(self)
      @image.src(args)
    end
  end
end
