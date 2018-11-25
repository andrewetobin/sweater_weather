require 'rails_helper'

describe 'favoriting locations API' do
  it 'allows user to favorite a location' do
    user = create(:user)
    post "/api/v1/favorites?location=Denver,+CO&api_key=#{user.api_key}"
    expect(response).to be_successful
    expect(user.favorites.count).to eq(1)

    user_response = JSON.parse(response.body)

    expect(user_response).to have_key("data")
    expect(user_response["data"][0]["attributes"]).to eq({"location"=>"Denver,  CO"})
  end
  it 'does not allow a user to favorite a location with an invalid api key' do
    user = create(:user)
    post "/api/v1/favorites?location=Denver,+CO&api_key=NotARealApiKey"
    expect(response).to have_http_status(401)
  end
  it 'allows a user to see a list of all their locations' do
    user = create(:user)
    user.cities.create(name: "Denver", state: "CO")
    user.cities.create(name: "San Francisco", state: "CA")

    get "/api/v1/favorites?api_key=#{user.api_key}"

    expect(response).to be_successful
    expect(user.cities.count).to eq(2)
    data = JSON.parse(response.body)

    expect(data["data"][0]["type"]).to eq("favorite")
    expect(data["data"][0]["attributes"].keys).to contain_exactly('location')
  end
  it 'allows a user to delete a favorite' do
    user = create(:user)
    user.cities.create(name: "Denver", state: "CO")
    user.cities.create(name: "San Francisco", state: "CA")

    expect(user.cities.count).to eq(2)

    delete "/api/v1/favorites?location=Denver,+CO&api_key=#{user.api_key}"

    expect(response).to be_successful
    expect(user.cities.count).to eq(1)
  end
end
