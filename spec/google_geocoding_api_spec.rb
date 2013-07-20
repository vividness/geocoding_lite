require 'spec_helper'

describe GeocodingLite::GoogleGeocodingAPI do
  describe ''

  describe '#parse' do
    it 'parses JSON response' do
      res =<<-JSON
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

    expected = {
      :address   => 'Australia', 
      :latitude  => -25.274398, 
      :longitude => 133.775136, 
      :types     => [
        'country', 
        'political'
      ]
    }

    returned = GeocodingLite::GoogleGeocodingAPI.parse(res)  
    
    returned[:address].should be   == expected[:address]
    returned[:latitude].should be  == expected[:latitude]
    returned[:longitude].should be == expected[:longitude]
    returned[:types].should be     == expected[:types]
    end
  end
end
