require 'spec_helper'

describe GeocodingLite::Image do 
  let :location do 
    location = GeocodingLite::Location.new
    location.latitude  = 0
    location.longitude = 0
    location.types     = ['street_address']

    location
  end
  
  subject { GeocodingLite::Image.new(location) }

  describe '#initialize' do
    it 'returns an instance' do
      subject.should be_kind_of GeocodingLite::Image
    end
  end

  describe '#src' do 
    it 'returns image url' do 
      expected = 'http://maps.googleapis.com/maps/api/staticmap?sensor=false&size=640x480&zoom=15&scale=1&maptype=roadmap&center=0,0'
      
      subject.src.should == expected
    end
  end
end
