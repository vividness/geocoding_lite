Geocoding Lite [![Build Status](https://travis-ci.org/mancmelou/geocoding_lite.png?branch=master)](https://travis-ci.org/mancmelou/geocoding_lite) [![Gem Version](https://badge.fury.io/rb/geocoding_lite.png)](http://badge.fury.io/rb/geocoding_lite)
==============
Lookup addresses, cities and geographical coordinates!

Table of contents
-----------------
1. [What is geocoding?](https://github.com/mancmelou/geocoding_lite#what-is-geocoding)
2. [Installation](https://github.com/mancmelou/geocoding_lite#installation)
3. [Geocoding in action](https://github.com/mancmelou/geocoding_lite#geocoding-in-action)
4. [Reverse geocoding](https://github.com/mancmelou/geocoding_lite#reverse-geocoding)
5. [Important things to know](https://github.com/mancmelou/geocoding_lite#important-things-to-know)
6. [Documentation](https://github.com/mancmelou/geocoding_lite#documentation)
7. [Contributing](https://github.com/mancmelou/geocoding_lite#contributing)
8. [Author](https://github.com/mancmelou/geocoding_lite#author)

What is geocoding?
------------------
Geocoding is the process of finding associated geographic coordinates (often expressed as latitude and longitude) 
from other geographic data, such as street addresses, or ZIP codes (postal codes). 
With geographic coordinates the features can be mapped and entered into Geographic Information Systems, 
or the coordinates can be embedded into media such as digital photographs via geotagging.

http://en.wikipedia.org/wiki/Geocoding


Installation
------------

    gem install geocoding_lite
   
Geocoding in action
-------------------
It's super simple! Follow the example: 

```ruby
require 'geocoding_lite'

results = '12783 Pico Blvd, Santa Monica'.geocoding_lookup

puts results
```

Will output this
```ruby
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
```
Reverse geocoding
-----------------
You can also do reverse lookups. Hooray! For instance, if you're extracting gps coordinates info 
from your smartphone photo library and you want to see what is the closest address to the 
location where the photo is taken.

See the following example: 

```ruby 
require 'geocoding_lite'

# Coordinates of Brookly NY.
# Note that when doing reverse geocoding you need 
# to put your coordinates in an array. 
# The size of array is 2 elements.
#   coordinates[0] for lattitude
#   coordinates[1] for longitude
coordinates = [40.714224, -73.961452]

puts coordinates.geocoding_lookup.first
```

Should return this: 
```ruby
{
  :address => "287 Bedford Avenue, Brooklyn, NY 11211, USA", 
  :lat     => 40.7140334, 
  :lng     => -73.9614979, 
  :types   => ["street_address"]
}
```

Important things to know
------------------------
Geocoding Lite is based on Google's geocoding API and therefore it's a subject to certain limitations.
One of the limitations is that using this library, a user can make up to 2500 requests a day so, please, use 
it responsibly. For more info please check the link below.

https://developers.google.com/maps/documentation/geocoding/#Limits

Also, if you are looking for more powerful geocoding library I recommend you trying geocoder.

http://www.rubygeocoder.com/

Documentation
-------------
All text above written is all you need to know! :)

Contributing
------------
Any help on this project is very welcome. Please feel free to fork, modify and 
make pull requests. Also make sure you check the TODO file when the file is present in the repository. 

Author
------
Geocoding Lite was written by Vladimir Ivic (vladimir.ivic at icloud.com) and is
released under the MIT license.
