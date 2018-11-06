require 'rails_helper'

describe "GET '/api/v1/backgrounds?location=denver,co'" do
  it 'can send background image' do

    get "/api/v1/backgrounds?location=denver,co"

    expect(response).to be_successful

    image = JSON.parse(response.body, symbolize_names: true)

    return_json =
    { image => "https://weather.com " }

    expect(image).to eq(return_json)

  end
end
