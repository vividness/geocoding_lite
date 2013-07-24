require 'spec_helper'

describe GeocodingLite::GeocodingService do
  let(:http_object) do
    http_object = Object.new
    def http_object.get_response(uri)
      self
    end

    def http_object.body 
      <<-JSON
{
   "results" : [
      {
         "address_components" : [
            {
               "long_name" : "Australia",
               "short_name" : "AU",
               "types" : [ "country", "political" ]
            }
         ],
         "formatted_address" : "Australia",
         "geometry" : {
            "bounds" : {
               "northeast" : {
                  "lat" : -9.22108360,
                  "lng" : 159.25552830
               },
               "southwest" : {
                  "lat" : -54.77721850,
                  "lng" : 112.92145440
               }
            },
            "location" : {
               "lat" : -25.2743980,
               "lng" : 133.7751360
            },
            "location_type" : "APPROXIMATE",
            "viewport" : {
               "northeast" : {
                  "lat" : -9.22680570,
                  "lng" : 153.63867380
               },
               "southwest" : {
                  "lat" : -43.6583270,
                  "lng" : 112.92397210
               }
            }
         },
         "types" : [ "country", "political" ]
      }
   ],
   "status" : "OK"
}
JSON
    end

    http_object
  end

  let(:uri_object) do
    uri_object = Object.new
    uri_object.instance_eval do
      def encode(address)
        address
      end

      def parse(request_uri)
        request_uri
      end
    end

    uri_object
  end

  let(:service_url) { 'http://localhost' }
  let(:json_parser) { JSON }
  
  subject do
    GeocodingLite::GeocodingService.new(http_object, 
      uri_object, service_url, json_parser
    )
  end
  
  describe '#initalize' do
    it 'returns an instance' do
      subject.should be_kind_of GeocodingLite::GeocodingService 
    end
  end

  describe '#lookup' do
    it 'resolves an address lookup' do
      result = subject.lookup('Australia')

      result[0][:address].should be_eql 'Australia'
      result[0][:lat].should be_eql     -25.2743980
      result[0][:lng].should be_eql     133.7751360
    end
  end
end
