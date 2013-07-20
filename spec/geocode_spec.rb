require 'spec_helper'

describe GeocodingLite::Geocode do
  let :api do
    # mock object
    api = Class.new
    
    class << api
      def lookup(address)
        {
          :address   => 'ADDRESS',
          :latitude  => 'LATITUDE',
          :longitude => 'LONGITUDE',
          :types     => ['type1', 'type2']
        }
      end
    end
    
    api
  end

  let :location do
    # mock object
    location = Object.new

    class << location
      attr_accessor :address, :latitude, :longitude, :types 
    end

    location
  end

  subject { GeocodingLite::Geocode.new(location, api) }
  
  describe '#initialize' do
    it 'returns an instance' do 
      subject.should be_kind_of GeocodingLite::Geocode
    end
  end

  describe '#lookup' do
    it 'resolved an adderss' do 
      returned = subject.lookup('ADDRESS')

      returned.address.should be   == 'ADDRESS'
      returned.latitude.should be  == 'LATITUDE'
      returned.longitude.should be == 'LONGITUDE'
    end
  end
end
