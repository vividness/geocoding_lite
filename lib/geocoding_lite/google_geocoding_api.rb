require 'net/http'
require 'rubygems'
require 'json'

module GeocodingLite  
  class GoogleGeocodingAPI
    API_ENDPOINT = %q(http://maps.googleapis.com/maps/api/geocode/json)
    
    attr_accessor :endpoint, :http_object
    
    def initialize
    end

    def config(&block)
      yield self
    end
    
    def resolve(address)
    end

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
      json   = JSON.parse(response)
      status = json['status']
      result = json['results'].first
      
      raise RuntimeError, "API returned #{status}" if status != 'OK'

      output             = {}
      output[:address]   = result['formatted_address']
      output[:latitude]  = result['geometry']['location']['lat']
      output[:longitude] = result['geometry']['location']['lng']
      output[:types]     = result['types']
      
      output
    end
  end
end
