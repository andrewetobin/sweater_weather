require 'rails_helper'

describe "GET '/api/v1/forecast?location=denver,co'" do
  xit 'can send weather info' do

    VCR.use_cassette("user gets weather forecast") do
      get "/api/v1/forecast?location=denver,co"
    end

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)

    return_json ={:location=>"Denver, CO, USA",
     :currently=>
      {:current_time=>"2018-11-13T09:39:18.000-07:00",
       :current_temperature=>36,
       :current_summary=>"Partly Cloudy",
       :icon=>"partly-cloudy-day",
       :high=>45,
       :low=>26},
     :details=>
      {:current_summary=>"Partly Cloudy",
       :icon=>"partly-cloudy-day",
       :today=>"Mostly cloudy in the morning.",
       :tonight=>"Clear throughout the day.",
       :feels_like=>36,
       :humidity=>"50.0 %",
       :visibility=>"10 mile(s)",
       :UV_Index=>2},
     :hourly=>
      [{:time=>"2018-11-13T09:00:00.000-07:00",
        :icon=>"partly-cloudy-day",
        :temperature=>33.27},
       {:time=>"2018-11-13T10:00:00.000-07:00",
        :icon=>"partly-cloudy-day",
        :temperature=>37.07},
       {:time=>"2018-11-13T11:00:00.000-07:00",
        :icon=>"partly-cloudy-day",
        :temperature=>39.74},
       {:time=>"2018-11-13T12:00:00.000-07:00", :icon=>"clear-day", :temperature=>41.8},
       {:time=>"2018-11-13T13:00:00.000-07:00", :icon=>"clear-day", :temperature=>43.56},
       {:time=>"2018-11-13T14:00:00.000-07:00", :icon=>"clear-day", :temperature=>44.63},
       {:time=>"2018-11-13T15:00:00.000-07:00", :icon=>"clear-day", :temperature=>44.21},
       {:time=>"2018-11-13T16:00:00.000-07:00", :icon=>"clear-day", :temperature=>42.13}],
     :forecast=>
      [{:day=>"2018-11-14T00:00:00.000-07:00",
        :icon=>"clear-day",
        :high=>50.49,
        :low=>30.91,
        :precip=>"1.0 %"},
       {:day=>"2018-11-15T00:00:00.000-07:00",
        :icon=>"clear-day",
        :high=>53.26,
        :low=>32.15,
        :precip=>"0 %"},
       {:day=>"2018-11-16T00:00:00.000-07:00",
        :icon=>"partly-cloudy-day",
        :high=>54.85,
        :low=>26.46,
        :precip=>"1.0 %"},
       {:day=>"2018-11-17T00:00:00.000-07:00",
        :icon=>"snow",
        :high=>43.7,
        :low=>22.57,
        :precip=>"20.0 %"},
       {:day=>"2018-11-18T00:00:00.000-07:00",
        :icon=>"partly-cloudy-night",
        :high=>39.94,
        :low=>24.19,
        :precip=>"18.0 %"}]}

    expect(forecast).to eq(return_json)
  end
end
describe "GET '/api/v1/forecast?lat=37.773972&long=-122.431297'" do
  it 'can send weather info lat/long' do

    VCR.use_cassette("user gets weather forecast latlong") do
      get "/api/v1/forecast?lat=37.773972&long=-122.431297"
    end

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)

    return_json = {:location=>"Denver, CO, USA",
     :currently=>
      {:current_time=>"2018-11-13T09:39:18.000-07:00",
       :current_temperature=>36,
       :current_summary=>"Partly Cloudy",
       :icon=>"partly-cloudy-day",
       :high=>45,
       :low=>26},
     :details=>
      {:current_summary=>"Partly Cloudy",
       :icon=>"partly-cloudy-day",
       :today=>"Mostly cloudy in the morning.",
       :tonight=>"Clear throughout the day.",
       :feels_like=>36,
       :humidity=>"50.0 %",
       :visibility=>"10 mile(s)",
       :UV_Index=>2},
     :hourly=>
      [{:time=>"2018-11-13T09:00:00.000-07:00",
        :icon=>"partly-cloudy-day",
        :temperature=>33.27},
       {:time=>"2018-11-13T10:00:00.000-07:00",
        :icon=>"partly-cloudy-day",
        :temperature=>37.07},
       {:time=>"2018-11-13T11:00:00.000-07:00",
        :icon=>"partly-cloudy-day",
        :temperature=>39.74},
       {:time=>"2018-11-13T12:00:00.000-07:00", :icon=>"clear-day", :temperature=>41.8},
       {:time=>"2018-11-13T13:00:00.000-07:00", :icon=>"clear-day", :temperature=>43.56},
       {:time=>"2018-11-13T14:00:00.000-07:00", :icon=>"clear-day", :temperature=>44.63},
       {:time=>"2018-11-13T15:00:00.000-07:00", :icon=>"clear-day", :temperature=>44.21},
       {:time=>"2018-11-13T16:00:00.000-07:00", :icon=>"clear-day", :temperature=>42.13}],
     :forecast=>
      [{:day=>"2018-11-14T00:00:00.000-07:00",
        :icon=>"clear-day",
        :high=>50.49,
        :low=>30.91,
        :precip=>"1.0 %"},
       {:day=>"2018-11-15T00:00:00.000-07:00",
        :icon=>"clear-day",
        :high=>53.26,
        :low=>32.15,
        :precip=>"0 %"},
       {:day=>"2018-11-16T00:00:00.000-07:00",
        :icon=>"partly-cloudy-day",
        :high=>54.85,
        :low=>26.46,
        :precip=>"1.0 %"},
       {:day=>"2018-11-17T00:00:00.000-07:00",
        :icon=>"snow",
        :high=>43.7,
        :low=>22.57,
        :precip=>"20.0 %"},
       {:day=>"2018-11-18T00:00:00.000-07:00",
        :icon=>"partly-cloudy-night",
        :high=>39.94,
        :low=>24.19,
        :precip=>"18.0 %"}]}

    expect(forecast).to eq(return_json)
  end
end
