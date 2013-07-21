require 'net/http'
require 'rubygems'
require 'json'

module GeocodingLite
  class GeocodingService
    SERVICE_URI = %q(http://maps.googleapis.com/maps/api/geocode/json)
    
    def initialize(http = nil, uri = nil, json = nil)
      @http_object = http || Net::HTTP
      @uri_object  = uri  || URI
      @json_object = JSON
      @endpoint    = SERVICE_URI
    end
    
    def lookup(address)
      load_response(send_request(address))
    end
    
    private 
    
    def load_response(raw_response)
      json   = @json_object.parse(raw_response)
      
      status = json['status']
      raise RuntimeError, "API returned #{status}" if status != 'OK'
  
      result = json['results'].first
      
      output             = {}
      output[:address]   = result['formatted_address']
      output[:latitude]  = result['geometry']['location']['lat']
      output[:longitude] = result['geometry']['location']['lng']
      output[:types]     = result['types']
      
      output
    end
    
    def send_request(address)
      address_enc = @uri_object.encode(address)
      request_uri = "#{SERVICE_URI}address=#{address_enc}&sensor=false"  
      uri = @uri_object.parse(request_uri)
      
      response = @http_object.get_response(uri)
      response.body
    end
  end
end
