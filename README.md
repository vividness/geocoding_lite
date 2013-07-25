Geocoding Lite
==============
The simplest geocoding lookup tool - ever!

Installation
------------

    gem install geocoding_lite
   
How to use it
-------------
It's super simple! Follow the example: 

```ruby
require 'geocoding_lite'

results = '12783 Pico Blvd, Santa Monica'.geocoding_lookup

puts results
```

Will output this

    [
      {
        :address => "Pico Boulevard, Santa Monica, CA, USA", 
        :lat     => 34.0176723, 
        :lng     => -118.4727648, 
        :types   => ["route"]
      }, {
        :address => "West Pico Boulevard, CA, USA", 
        :lat     => 34.0373139, 
        :lng     => -118.4343903, 
        :types   => ["route"]
      }, {
        :address => "Santa Monica Boulevard, Santa Monica, CA, USA", 
        :lat     => 34.023733, 
        :lng     => -118.485698, 
        :types   => ["route"]
      }
    ]

Reverse lookup
--------------
You can also do reverse lookups. Hooray! For instance, if you're extracting gps coordinates info 
from your smartphone photo library and you want to see what is the closest address to the 
location where the photo is taken.

See the following example: 

```ruby 
require 'geocoding_lite'

# Coordinates of Brookly NY.
# Note that when doing reverse geocoding you need 
# to put your coordinates in an array. The size of array
# is 2 elements.
coordinates = [40.714224, -73.961452]

puts coordinates.geocoding_lookup.first
```

Should return this: 

    {
      :address => "287 Bedford Avenue, Brooklyn, NY 11211, USA", 
      :lat     => 40.7140334, 
      :lng     => -73.9614979, 
      :types   => ["street_address"]
    }

Documentation
-------------
The above written is all you need to know! :)

Contributing
------------
Any help on this project is very welcome. Please feel free to fork, modify and 
make pull requests. Also make sure you check the TODO file when the file is present in the repository. 

Author
------
Geocoding Lite was written by Vladimir Ivic (vladimir.ivic at icloud.com) and is
released under the MIT license.
