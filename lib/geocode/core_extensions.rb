class ::String
  def to_location
    Geocode.config unless Geocode.instance
    Geocode.instance.lookup(self)
  end
end