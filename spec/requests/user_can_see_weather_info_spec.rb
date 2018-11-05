require 'rails_helper'

describe "GET '/api/v1/forecast?location=denver,co'" do
  it 'can send weather info' do

    VCR.use_cassette("user gets weather forecast") do
      get "/api/v1/forecast?location=denver,co"
    end 

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)

    return_json =  {
      "game_id": 1,
      "scores": [
        {
          "user_id":1,
          "score":15
        },
        {
          "user_id":2,
          "score":16
        }
      ]
    }

    expect(forecast).to eq(return_json)
  end
end
