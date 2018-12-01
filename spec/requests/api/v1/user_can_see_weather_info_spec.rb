require 'rails_helper'

describe "GET '/api/v1/forecast?location=denver,co'" do
  it 'can send weather info' do

    VCR.use_cassette("user gets weather forecast") do
      get "/api/v1/forecast?location=denver,co"
    end

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)

    return_json = {:location=>"Denver, CO",
    :currently=>
    {:current_time=>"2018-11-30T20:10:18.000-07:00",
    :current_temperature=>34,
    :current_summary=>"Overcast",
    :icon=>"cloudy",
    :high=>36,
    :low=>29},
    :details=>
    {:current_summary=>"Overcast",
    :icon=>"cloudy",
    :today=>"Foggy in the morning.",
    :tonight=>"Breezy in the afternoon and mostly cloudy starting in the evening.",
    :feels_like=>34,
    :humidity=>"85.0 %",
    :visibility=>"5.81 mile(s)",
    :UV_Index=>0},
    :hourly=>
    [{:time=>"2018-11-30T20:00:00.000-07:00", :icon=>"cloudy", :temperature=>33.8},
    {:time=>"2018-11-30T21:00:00.000-07:00",
    :icon=>"partly-cloudy-night",
    :temperature=>33.33},
    {:time=>"2018-11-30T22:00:00.000-07:00",
    :icon=>"partly-cloudy-night",
    :temperature=>32.71},
    {:time=>"2018-11-30T23:00:00.000-07:00",
    :icon=>"partly-cloudy-night",
    :temperature=>31.98},
    {:time=>"2018-12-01T00:00:00.000-07:00",
    :icon=>"partly-cloudy-night",
    :temperature=>31.66},
    {:time=>"2018-12-01T01:00:00.000-07:00",
    :icon=>"partly-cloudy-night",
    :temperature=>31.88},
    {:time=>"2018-12-01T02:00:00.000-07:00", :icon=>"clear-night", :temperature=>31.95},
    {:time=>"2018-12-01T03:00:00.000-07:00", :icon=>"clear-night", :temperature=>31.55}],
    :forecast=>
    [{:day=>"2018-12-01T00:00:00.000-07:00",
    :icon=>"wind",
    :high=>42.38,
    :low=>26.93,
    :precip=>"7.000000000000001 %"},
    {:day=>"2018-12-02T00:00:00.000-07:00",
    :icon=>"fog",
    :high=>31.47,
    :low=>20.5,
    :precip=>"23.0 %"},
    {:day=>"2018-12-03T00:00:00.000-07:00",
    :icon=>"partly-cloudy-day",
    :high=>30.59,
    :low=>15.17,
    :precip=>"19.0 %"},
    {:day=>"2018-12-04T00:00:00.000-07:00",
    :icon=>"partly-cloudy-night",
    :high=>37.27,
    :low=>19.26,
    :precip=>"0 %"},
    {:day=>"2018-12-05T00:00:00.000-07:00",
    :icon=>"partly-cloudy-day",
    :high=>45.01,
    :low=>17.53,
    :precip=>"0 %"}]}

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

    return_json = {:location=>"San Francisco, CA",
 :currently=>
  {:current_time=>"2018-11-30T20:24:53.000-07:00",
   :current_temperature=>53,
   :current_summary=>"Clear",
   :icon=>"clear-night",
   :high=>59,
   :low=>51},
 :details=>
  {:current_summary=>"Clear",
   :icon=>"clear-night",
   :today=>"Partly cloudy until afternoon.",
   :tonight=>"Light rain in the morning and breezy until evening.",
   :feels_like=>53,
   :humidity=>"74.0 %",
   :visibility=>"10 mile(s)",
   :UV_Index=>0},
 :hourly=>
  [{:time=>"2018-11-30T20:00:00.000-07:00", :icon=>"clear-night", :temperature=>53.07},
   {:time=>"2018-11-30T21:00:00.000-07:00", :icon=>"clear-night", :temperature=>52.47},
   {:time=>"2018-11-30T22:00:00.000-07:00", :icon=>"clear-night", :temperature=>51.96},
   {:time=>"2018-11-30T23:00:00.000-07:00", :icon=>"clear-night", :temperature=>51.59},
   {:time=>"2018-12-01T00:00:00.000-07:00", :icon=>"clear-night", :temperature=>51.38},
   {:time=>"2018-12-01T01:00:00.000-07:00", :icon=>"clear-night", :temperature=>51.6},
   {:time=>"2018-12-01T02:00:00.000-07:00", :icon=>"clear-night", :temperature=>50.93},
   {:time=>"2018-12-01T03:00:00.000-07:00",
    :icon=>"partly-cloudy-night",
    :temperature=>51.35}],
 :forecast=>
  [{:day=>"2018-12-01T01:00:00.000-07:00",
    :icon=>"rain",
    :high=>56.22,
    :low=>45.59,
    :precip=>"87.0 %"},
   {:day=>"2018-12-02T01:00:00.000-07:00",
    :icon=>"partly-cloudy-night",
    :high=>54.49,
    :low=>44.22,
    :precip=>"5.0 %"},
   {:day=>"2018-12-03T01:00:00.000-07:00",
    :icon=>"partly-cloudy-night",
    :high=>53.44,
    :low=>49.23,
    :precip=>"20.0 %"},
   {:day=>"2018-12-04T01:00:00.000-07:00",
    :icon=>"rain",
    :high=>52.09,
    :low=>49.72,
    :precip=>"100 %"},
   {:day=>"2018-12-05T01:00:00.000-07:00",
    :icon=>"rain",
    :high=>50.63,
    :low=>50.21,
    :precip=>"100 %"}]}

    expect(forecast).to eq(return_json)
  end
end
