Geocoding Lite
==============
The simplest geocoding lookup wrapper ever!

How to use it
-------------
It's dead simple!

```ruby
require 'geocoding_lite'

lookup_result = '12783 Pico Blvd, Santa Monica'.geocode

puts lookup_result
```

Will output this

    [
      {
        :address => "Pico Boulevard, Santa Monica, CA, USA", 
        :lat     => 34.0176723, 
        :lng     => -118.4727648
      },
      {
        :address => "West Pico Boulevard, CA, USA", 
        :lat     => 34.0373139, 
        :lng     => -118.4343903
      },
      {
        :address => "Santa Monica Boulevard, Santa Monica, CA, USA", 
        :lat     => 34.023733, 
        :lng     => -118.485698
      }
    ]
