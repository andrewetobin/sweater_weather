require 'rails_helper'

describe 'favoriting locations API' do
  it 'allows user to favorite a location' do
    user = create(:user)
    post "/api/v1/favorites?location=Denver,+CO&api_key=#{user.api_key}"
    expect(response).to be_successful
    expect(user.favorites.count).to eq(1)

    user_response = JSON.parse(response.body)

    expect(user_response).to have_key("favorites")
    expect(user_response["favorites"]).to eq(["Denver,  CO"])
  end
  xit 'does not allow a user to favorite a location with an invalid api key' do
    user = create(:user)
    post "/api/v1/favorites?location=Denver,+CO&api_key=NotARealApiKey"
    expect(response).to have_http_status(401)
  end
  xit 'allows a user to see a list of all their locations' do
    user = create(:user)
    user.cities.create(name: "Denver", state: "CO")

    get "/api/v1/favorites?api_key=#{user.api_key}"

    expect(response).to be_successful
    expect(user.cities.count).to eq(1)
    data = JSON.parse(response.body)
    expect(data["data"][0]["type"]).to eq("favorite")
    expect(data["data"][0]["attributes"].keys).to contain_exactly('id', 'location', 'current_weather')
  end
  xit 'allows a user to delete a favorite' do
    user = create(:user)
    user.cities.create(name: "Denver", state: "CO")
    delete "/api/v1/favorites?location=Denver,+CO&api_key=#{user.api_key}"
    expect(response).to be_successful
    expect(user.cities.count).to eq(0)
  end
end
