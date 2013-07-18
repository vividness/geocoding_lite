class ::String
  def locate
    GeocodingLite.lookup(self)
  end
end
