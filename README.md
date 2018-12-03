
## Introduction and Function

   SweaterWeather is a weather app that will show the current weather, further current details, hourly forecast, and five day forecast. 
   On page load the user's current location is found and the current weather is displayed on page. User can change location and see weather from that location. 



## Design and Architecture

SweaterWeather is built in Rails and uses JavaScript to fetch info and update page. Backend is in Ruby creating API endpoints for front end to consume. 

## Setup and Implementation

* Change into new directory, and run ``git clone git@github.com:andrewetobin/sweater_weather.git``
* cd into project.
* Run ``bundle``
* Run ``bundle exec figaro install``
* Sign up for Google Geocode, DarkSky, and Flicker API keys at https://developers.google.com/maps/documentation/geocoding/start , https://darksky.net/dev , and https://www.flickr.com/services/api/misc.api_keys.html  .
* Add keys info into your ``config/application.yml`` file.
* Run ``rails s`` to run project locally. 
* Go to ``localhost:3000`` in a browser.


## Tools/Dependencies

* Ruby 2.5.1
* Rails 5.2.1
* [Byebug](https://github.com/deivid-rodriguez/byebug/blob/master/README.md)
* [Capybara](https://github.com/teamcapybara/capybara)
* [Faraday](https://github.com/lostisland/faraday)
* [Figaro](https://github.com/laserlemon/figaro)
* [Launchy](https://github.com/copiousfreetime/launchy)
* [Pry](https://github.com/pry/pry)
* [Rspec-rails](https://github.com/rspec/rspec)
* [Shoulda-Matchers](https://github.com/thoughtbot/shoulda-matchers)
* [SimpleCov](https://github.com/colszowka/simplecov)
* [VCR](https://relishapp.com/vcr/vcr/docs)
* [Webmock](https://github.com/bblimke/webmock)
