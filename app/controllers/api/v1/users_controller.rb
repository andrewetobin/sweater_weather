class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    user.generate_api_key
    if user.save
     render json: {api_key: user.api_key}, status: 200
    else
     render json: {message: "Error"}, status: 401
    end
  end

  private

    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
