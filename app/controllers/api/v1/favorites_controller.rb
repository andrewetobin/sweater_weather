class Api::V1::FavoritesController < ApplicationController
  before_action :find_user, :validate_user

  def create
    user = User.find_by(api_key: favorite_params[:api_key])
    city_split = favorite_params[:location].split(",")
    city = City.create(name: city_split[0], state: city_split[1])
    user.cities << city
    favorite = Favorite.find_by(user_id: user.id)

    render json: favorite
  end

  private

    def favorite_params
      params.permit(:location, :api_key)
    end

    def find_user
      @user ||= User.find_by(api_key: favorite_params[:api_key])
    end

    def validate_user
      render json: {errors: "User invalid"}, status: 401 if @user.nil?
    end


end
