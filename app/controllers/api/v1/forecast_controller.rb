class Api::V1::ForecastController < ApplicationController

  def index
    cord_finder = CordFinder.new(params[:location])
    forecast = ForcastFinder.new(cord_finder.coordinates.join(","))
    require "pry"; binding.pry

    render json: location
  end

end
