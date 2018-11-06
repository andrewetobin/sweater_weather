class Api::V1::ForecastsController < ApplicationController

  def index
    cord_finder = CordFinder.new(params[:location])
    forecast = ForecastFinder.new(cord_finder)

    render json: forecast
  end

end
