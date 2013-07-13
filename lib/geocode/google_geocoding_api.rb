require 'net/http'
require 'rubygems'
require 'json'

module Geocode  
  class GoogleGeocodingAPI
    API_ENDPOINT = %q(http://maps.googleapis.com/maps/api/geocode/json)
    
    def self.lookup(address)
      response = request(address)
      parse(response)
    end
    
    def self.request(address)
      uri = URI(API_ENDPOINT)
      uri.query = "address=#{URI.encode(address)}&sensor=false"
      
      response = Net::HTTP.get_response(uri)
      response.body if response.is_a?(Net::HTTPSuccess)
    end
    
    # NOTE: Fix this methods if needed more than just one result
    def self.parse(response)
      result = JSON.parse(response)['results'].first
      
      output           = {}
      output[:address] = result['formatted_address']
      output[:lat]     = result['geometry']['location']['lat']
      output[:lng]     = result['geometry']['location']['lng']
      output[:types]   = result['types']
      
      output
    end
  end
end