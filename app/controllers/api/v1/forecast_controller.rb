class Api::V1::ForecastController < ApplicationController

  def index
    location = params[:location]

    cord_finder = CordFinder.new(location)
    require "pry"; binding.pry


    render json: location
  end

end
