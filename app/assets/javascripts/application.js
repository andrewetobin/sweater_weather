// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery3
//= require popper
//= require bootstrap
//= require_tree .


window.onload = function () {
  console.log('Hello')
  navigator.geolocation.getCurrentPosition(success, error);

  function success(pos) {
      var lat = pos.coords.latitude;
      var long = pos.coords.longitude;
      weather(lat, long);
  }
  function error() {
    console.log('There was an error');
  }
  function weather(lat, long) {
       var URL = `https://fcc-weather-api.glitch.me/api/current?lat=${lat}&lon=${long}`;

       $.getJSON(URL, function(data) {
           updateDOM(data);
       });
   }

   // Update Dom
  function updateDOM(data) {
    var city = data.name;
      var temp = Math.round(data.main.temp_max);
      var desc = data.weather[0].description;
      var icon = data.weather[0].icon;

      $('#city').html(city);
      $('#temp').html(temp);
      $('#desc').html(desc);
      $('#icon').attr('src', icon);
  }

}
