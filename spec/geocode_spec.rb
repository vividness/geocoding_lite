require 'spec_helper'

describe GeocodingLite::Geocode do
  let(:service) do
    service = Class.new
    
    class << service
      def lookup(address)
        {
          :address   => 'ADDRESS',
          :latitude  => 'LATITUDE',
          :longitude => 'LONGITUDE',
        }
      end
    end
    
    service
  end

  subject { GeocodingLite::Geocode.new(service) }
  
  describe '#initialize' do
    it 'returns an instance' do 
      subject.should be_kind_of GeocodingLite::Geocode
    end
  end

  describe '#lookup' do
    it 'resolved an adderss' do 
      returned = subject.lookup('ADDRESS')

      returned[:address].should be   == 'ADDRESS'
      returned[:latitude].should be  == 'LATITUDE'
      returned[:longitude].should be == 'LONGITUDE'
    end
  end
end
