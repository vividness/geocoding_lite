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
    
    def lookup(address)
      load_response(send_request(address))
    end
    
    private 
    
    def load_response(raw_response)
      json = @json_parser.parse(raw_response)
      
      status = json['status']
      raise RuntimeError, "API returned #{status}" if status != 'OK'
 
      json['results'].inject([]) do |output, result|
        output << {
          :address => result['formatted_address'],
          :lat     => result['geometry']['location']['lat'],
          :lng     => result['geometry']['location']['lng'],
        }
      end
    end
    
    def send_request(address)
      address_enc = @uri_object.encode(address)
      request_uri = "#{@service_url}?address=#{address_enc}&sensor=false"  
      uri = @uri_object.parse(request_uri)
      
      response = @http_object.get_response(uri)
      response.body
    end
  end
end
