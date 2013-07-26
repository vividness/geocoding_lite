class ::String
  def geocoding_lookup
    GeocodingLite.lookup(self)
  end
end

class ::Array
  def geocoding_lookup
    raise ArgumentError, 'Wrong array size (expected 2 elements)' unless size.eql?(2)
    raise ArgumentError, 'Wrong coordinates (Float expected)' unless 
      self[0].kind_of?(Numeric) && self[1].kind_of?(Numeric)

    GeocodingLite.lookup(self)
  end
end
