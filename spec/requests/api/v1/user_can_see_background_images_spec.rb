require 'rails_helper'

describe "GET '/api/v1/backgrounds?location=denver,co'" do
  it 'can send background image' do

    VCR.use_cassette("user gets background image") do
      get "/api/v1/backgrounds?location=denver,co"
    end

    expect(response).to be_successful

    image = JSON.parse(response.body, symbolize_names: true)

    return_json =
    {:url=>"https://farm5.staticflickr.com/4338/37030744091_9cc6bce67e_b.jpg"}

    expect(image).to have_key(:url)
    expect(image.values.first[-3..-1]).to eq("jpg")
  end
end
