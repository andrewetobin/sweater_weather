require 'rails_helper'

describe "GET '/api/v1/forecast?location=denver,co'" do
  it 'can send weather info' do

    VCR.use_cassette("user gets weather forecast") do
      get "/api/v1/forecast?location=denver,co"
    end

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)

    return_json =  {:location=>"Denver, CO, USA",
 :currently=>
  [{:current_time=>"2018-11-05T10:30:54.000-07:00",
    :current_temperature=>51,
    :current_summary=>"Partly Cloudy",
    :high=>53,
    :low=>32}],
 :details=>
  [{:current_summary=>"Partly Cloudy",
    :today=>"Partly cloudy in the morning.",
    :tonight=>"Partly cloudy overnight.",
    :feels_like=>51,
    :humidity=>"27.0 %",
    :visibility=>"10 mile(s)",
    :"UV Index"=>3}]
  }

    expect(forecast).to eq(return_json)
  end
end
