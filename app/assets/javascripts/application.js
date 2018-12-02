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
  console.log('Hello there')
  navigator.geolocation.getCurrentPosition(success, error);

  function success(pos) {
    console.log('in success')

      var lat = pos.coords.latitude;
      var long = pos.coords.longitude;
      weather(lat, long);
  }
  function error() {
    console.log('There was an error');
  }
}
  function weather(lat, long) {
    console.log(lat);
    console.log(long);

       var url = `http://localhost:3000/api/v1/forecast?lat=${lat}&long=${long}`;


   //     $.getJSON(URL, function(data) {
   //         updateDOM(data);
   //     });
   // }
   fetch(url).then(function(response) {
    return response.json();
  })
  .then(function(myJson) {
    updateDOM(myJson);
  });
}

   // Update Dom
  function updateDOM(data) {
    console.log(data);
    console.log("inside updateDOM");
    var weatherImages = {
      "clear-day": "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Sun_icon.svg/252px-Sun_icon.svg.png",
      "clear-night": "http://www.clker.com/cliparts/f/S/2/p/7/u/gold-matte-moon.svg",
      "rain": "https://cdn3.iconfinder.com/data/icons/weather-16/256/Rainy_Day-512.png",
      "snow": "https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Nuvola_weather_snow.svg/1000px-Nuvola_weather_snow.svg.png",
      "sleet": "http://www.clker.com/cliparts/f/6/7/4/1206565674431593790Anonymous_simple_weather_symbols_10.svg.hi.png",
      "wind": "http://www.haotu.net/up/4233/128/216-wind.png",
      "fog": "http://www.iconninja.com/files/81/344/943/fog-cloud-hiding-the-sun-weather-interface-symbol-icon.svg",
      "cloudy": "http://camera.thietbianninh.com/images/icon-2.png",
      "partly-cloudy-day": "http://meteo.cw/images_www/weather_icons1/weather_icon_03.png",
      "partly-cloudy-night": "http://icon-park.com/imagefiles/simple_weather_icons_cloudy_night.png",
      "hail": "http://icons.iconarchive.com/icons/icons8/ios7/256/Weather-Hail-icon.png",
      "thunderstorm": "http://findicons.com/files/icons/2613/android_weather_extended/480/thunderstorms.png",
      "tornado": "http://hddfhm.com/images/clipart-of-a-tornado-11.png"
    }
    var location = data.location;
    var currentTemp = data.currently.current_temperature;
    var todaysHigh = data.currently.high;
    var todaysLow = data.currently.low;
    var currentTime = data.currently.current_time;
    var currentIcon = data.currently.icon;
    var detailsIcon = data.details.icon;
    var todayDesc = data.details.today;
    var tonightDesc = data.details.tonight;
    var feelsLike = data.details.feels_like;
    var humidity = data.details.humidity;
    var visibility = data.details.visibility;
    var visibility = data.details.visibility;
    var uv = data.details.UV_Index;
    var time1 = data.hourly[0].time;
    var time2 = data.hourly[1].time;
    var time3 = data.hourly[2].time;
    var time4 = data.hourly[3].time;
    var time5 = data.hourly[4].time;
    var time6 = data.hourly[5].time;
    var time7 = data.hourly[6].time;
    var time8 = data.hourly[7].time;
    var hour_1_Icon = data.hourly[0].icon;
    var hour_2_Icon = data.hourly[1].icon;
    var hour_3_Icon = data.hourly[2].icon;
    var hour_4_Icon = data.hourly[3].icon;
    var hour_5_Icon = data.hourly[4].icon;
    var hour_6_Icon = data.hourly[5].icon;
    var hour_7_Icon = data.hourly[6].icon;
    var hour_8_Icon = data.hourly[7].icon;
    var temp1 = data.hourly[0].temperature;
    var temp2 = data.hourly[1].temperature;
    var temp3 = data.hourly[2].temperature;
    var temp4 = data.hourly[3].temperature;
    var temp5 = data.hourly[4].temperature;
    var temp6 = data.hourly[5].temperature;
    var temp7 = data.hourly[6].temperature;
    var temp8 = data.hourly[7].temperature;
    var day1 = data.forecast[0].day;
    var day2 = data.forecast[1].day;
    var day3 = data.forecast[2].day;
    var day4 = data.forecast[3].day;
    var day5 = data.forecast[4].day;
    var icon1 = data.forecast[0].icon;
    var icon2 = data.forecast[1].icon;
    var icon3 = data.forecast[2].icon;
    var icon4 = data.forecast[3].icon;
    var icon5 = data.forecast[4].icon;
    var high1 = data.forecast[0].high;
    var high2 = data.forecast[1].high;
    var high3 = data.forecast[2].high;
    var high4 = data.forecast[3].high;
    var high5 = data.forecast[4].high;
    var low1 = data.forecast[0].low;
    var low2 = data.forecast[1].low;
    var low3 = data.forecast[2].low;
    var low4 = data.forecast[3].low;
    var low5 = data.forecast[4].low;
    var day_1_Icon = data.forecast[0].icon;
    var day_2_Icon = data.forecast[1].icon;
    var day_3_Icon = data.forecast[2].icon;
    var day_4_Icon = data.forecast[3].icon;
    var day_5_Icon = data.forecast[4].icon;


    //   var desc = data.weather[0].description;
    //   var icon = data.weather[0].icon;
    //
      $('#location').html(location);
      $('#current-temp').html(currentTemp);
      $('#todays-high-temp').html("High: " + todaysHigh);
      $('#todays-low-temp').html("Low: " + todaysLow);
      $('#current-time').html(currentTime)
      $('#current-icon').attr('src', weatherImages[currentIcon])
      $('#details-icon').attr('src', weatherImages[detailsIcon])
      $('#today-desc').html("Today: " + todayDesc)
      $('#tonight-desc').html("Tonight: " + tonightDesc)
      $('#feels-like').html("Feels Like: " + feelsLike)
      $('#humidity').html("Humidity: " + humidity)
      $('#visibility').html("Visibility: " + visibility)
      $('#Uv').html("UV Index: " + uv)
      $('#time-1').html(time1)
      $('#time-2').html(time2)
      $('#time-3').html(time3)
      $('#time-4').html(time4)
      $('#time-5').html(time5)
      $('#time-6').html(time6)
      $('#time-7').html(time7)
      $('#time-8').html(time8)
      $('#hour1-icon').attr('src', weatherImages[hour_1_Icon])
      $('#hour2-icon').attr('src', weatherImages[hour_2_Icon])
      $('#hour3-icon').attr('src', weatherImages[hour_3_Icon])
      $('#hour4-icon').attr('src', weatherImages[hour_4_Icon])
      $('#hour5-icon').attr('src', weatherImages[hour_5_Icon])
      $('#hour6-icon').attr('src', weatherImages[hour_6_Icon])
      $('#hour7-icon').attr('src', weatherImages[hour_7_Icon])
      $('#hour8-icon').attr('src', weatherImages[hour_8_Icon])
      $('#temp-1').html(temp1)
      $('#temp-2').html(temp2)
      $('#temp-3').html(temp3)
      $('#temp-4').html(temp4)
      $('#temp-5').html(temp5)
      $('#temp-6').html(temp6)
      $('#temp-7').html(temp7)
      $('#temp-8').html(temp8)
      $('#day-1').html(day1)
      $('#day-2').html(day2)
      $('#day-3').html(day3)
      $('#day-4').html(day4)
      $('#day-5').html(day5)
      $('#icon-1').html(icon1)
      $('#icon-2').html(icon2)
      $('#icon-3').html(icon3)
      $('#icon-4').html(icon4)
      $('#icon-5').html(icon5)
      $('#high-1').html("High: " + high1)
      $('#high-2').html("High: " + high2)
      $('#high-3').html("High: " + high3)
      $('#high-4').html("High: " + high4)
      $('#high-5').html("High: " + high5)
      $('#low-1').html("Low: " + low1)
      $('#low-2').html("Low: " + low2)
      $('#low-3').html("Low: " + low3)
      $('#low-4').html("Low: " + low4)
      $('#low-5').html("Low: " + low5)
      $('#day1-icon').attr('src', weatherImages[day_1_Icon])
      $('#day2-icon').attr('src', weatherImages[day_2_Icon])
      $('#day3-icon').attr('src', weatherImages[day_3_Icon])
      $('#day4-icon').attr('src', weatherImages[day_4_Icon])
      $('#day5-icon').attr('src', weatherImages[day_5_Icon])


    //   $('#desc').html(desc);
    //   $('#icon').attr('src', icon);
  }
