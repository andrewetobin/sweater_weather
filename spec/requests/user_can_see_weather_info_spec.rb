require 'rails_helper'

describe "GET '/api/v1/forecast?location=denver,co'" do
  it 'can send weather info' do

    VCR.use_cassette("user gets weather forecast") do
      get "/api/v1/forecast?location=denver,co"
    end

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)

    return_json =
    {:location=>"Denver, CO, USA",
    :currently=>
      {:current_time=>"2018-11-05T10:30:54.000-07:00",
        :current_temperature=>51,
        :current_summary=>"Partly Cloudy",
        :icon=>"partly-cloudy-day",
        :high=>53,
        :low=>32},
    :details=>
     [{:current_summary=>"Partly Cloudy",
       :icon=>"partly-cloudy-day",
       :today=>"Partly cloudy in the morning.",
       :tonight=>"Partly cloudy overnight.",
       :feels_like=>51,
       :humidity=>"27.0 %",
       :visibility=>"10 mile(s)",
       :"UV Index"=>3}],
    :forecast=>
     [{:day=>"2018-11-06T00:00:00.000-07:00",
       :icon=>"partly-cloudy-night",
       :high=>49,
       :low=>25,
       :precip=>"8.0 %"},
      {:day=>"2018-11-07T00:00:00.000-07:00",
       :icon=>"clear-day",
       :high=>44,
       :low=>25,
       :precip=>"9.0 %"},
      {:day=>"2018-11-08T00:00:00.000-07:00",
       :icon=>"clear-day",
       :high=>43,
       :low=>21,
       :precip=>"0 %"},
      {:day=>"2018-11-09T00:00:00.000-07:00",
       :icon=>"partly-cloudy-night",
       :high=>52,
       :low=>28,
       :precip=>"2.0 %"},
      {:day=>"2018-11-10T00:00:00.000-07:00",
       :icon=>"partly-cloudy-night",
       :high=>59,
       :low=>26,
       :precip=>"1.0 %"}]}

    expect(forecast).to eq(return_json)
  end
end
