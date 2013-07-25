require 'net/http'
require 'rubygems'
require 'json'

module GeocodingLite
  class GeocodingService
    SERVICE_URL = %q(http://maps.googleapis.com/maps/api/geocode/json)
    
    def initialize(http_object = nil, uri_object = nil, service_url = nil, json_parser = nil)
      @http_object = http_object || Net::HTTP
      @uri_object  = uri_object  || URI
      @json_parser = json_parser || JSON
      @service_url = service_url || SERVICE_URL
    end
    
    def lookup(location)
      load_response(send_request(location))
    end
    
    private 

    def load_response(raw_response)
      json = @json_parser.parse(raw_response)
      
      status = json['status']
      raise RuntimeError, "API returned #{status}" if 
        status != 'OK' && status != 'ZERO_RESULTS'
 
      json['results'].reduce([]) do |output, result|
        output << {
          :address => result['formatted_address'],
          :lat     => result['geometry']['location']['lat'],
          :lng     => result['geometry']['location']['lng'],
          :types   => result['types']
        }
      end
    end
    
    def prepare_params(location)
      url  = "#{@service_url}?"

      url << "address=#{@uri_object.encode(location)}" if
        location.kind_of? String

      url << "latlng=#{location.join(',')}" if
        location.kind_of? Array

      url << '&sensor=false'
    end

    def send_request(location)
      uri = @uri_object.parse(prepare_params(location))
      
      @http_object.get_response(uri).body
    end
  end
end
