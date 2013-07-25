class ::String
  def geocoding_lookup
    GeocodingLite.lookup(self)
  end
end

class ::Array
  def geocoding_lookup
    raise RuntimeError, 'Wrong array size (expected 2 elements)' unless size == 2
    raise RuntimeError, 'Wrong coordinates (Float expected)' unless 
      self[0].kind_of?(Numeric) && self[1].kind_of?(Numeric)

    GeocodingLite.lookup(self)
  end
end
