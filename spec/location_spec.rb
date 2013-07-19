require 'spec_helper'

describe GeocodingLite::Location do 
  describe '#image' do
    it 'returns image url' do
      expected = 'http://maps.googleapis.com/maps/api/staticmap?sensor=false&size=640x480&zoom=15&scale=1&maptype=roadmap&center=0,0'

      location = GeocodingLite::Location.new
      location.latitude  = 0
      location.longitude = 0
      location.types     = ['street_address']

      location.image.should == expected
    end
  end
end
