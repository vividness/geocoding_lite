class ::String
  def geocode
    GeocodingLite.lookup(self)
  end
end
