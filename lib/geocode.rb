require 'geocode/geocode'
require 'geocode/location'
require 'geocode/image'
require 'geocode/link'
require 'geocode/google_geocoding_api'
require 'geocode/core_extensions'
require 'geocode/version'

module Geocode
  def self.config
    @geocode = Geocode.new
    @geocode.instance_eval(&Proc.new) if block_given?
    
    @geocode
  end
  
  def self.instance
    @geocode
  end
end