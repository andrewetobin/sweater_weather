class Api::V1::ForecastsController < ApplicationController

  def index
    if params[:lat]
      coordinates = "#{params[:lat]},#{params[:long]}"
      cord_finder = CordFinder.new(coordinates)
      forecast = ForecastFinder.new(cord_finder)
    else
      cord_finder = CordFinder.new(params[:location])
      forecast = ForecastFinder.new(cord_finder)
    end

    render json: forecast
  end

end
