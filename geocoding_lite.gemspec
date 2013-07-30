Gem::Specification.new do |s| 
  s.name        = 'geocoding_lite'
  s.version     = '0.1.0'
  s.date        = '2013-07-30'
  s.summary     = 'Geocoding Lite'
  s.description = 'The simplest geocoding lookup tool - ever!'
  s.license     = 'MIT'
  s.authors     = ['Vladimir Ivic']
  s.email       = 'vladimir.ivic@icloud.com'
  s.homepage    = 'https://github.com/mancmelou/geocoding_lite'
  s.files       = %w(
    lib/geocoding_lite.rb 
    lib/geocoding_lite/geocode.rb   
    lib/geocoding_lite/core_extensions.rb 
    lib/geocoding_lite/geocoding_service.rb 
    lib/geocoding_lite/version.rb
  )
  s.add_dependency('json', '>= 1.8.0')
  s.require_paths = ['lib']
end
