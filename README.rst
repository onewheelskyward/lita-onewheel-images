lita-onewheel-images
--------------------

[![Build Status](https://travis-ci.org/onewheelskyward/lita-onewheel-images.png?branch=master)](https://travis-ci.org/onewheelskyward/lita-onewheel-images)
[![Coverage Status](https://coveralls.io/repos/onewheelskyward/lita-onewheel-images/badge.png)](https://coveralls.io/r/onewheelskyward/lita-onewheel-images)

TODO: Add a description of the plugin.

Installation
------------
Add lita-onewheel-images to your Lita instance's Gemfile:

``` ruby
gem "lita-onewheel-images"
```

Configuration
-------------

Lita.configure do |config|
  config.handlers.onewheel_images.custom_search_engine_id = '016450909327860943906:3a3e35xbkzu'
  config.handlers.onewheel_images.google_api_key = 'AIzaSyAlTbxqcZOlb3M-QXR4PCYpS2U1rfgwSlU'
  config.handlers.onewheel_images.safe_search = 'medium'  # This is the default setting.  Use 'off' at your own risk.
end

Usage
-----

Well, firstly, Google's API explorer can be a little trick.


Going Forward
-------------

I'm going to implement postgres and make sure I can track everything I want to track.  Testing the limits of the api calls since I get so few.
