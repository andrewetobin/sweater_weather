class Api::V1::BackgroundsController < ApplicationController

  def index
    cord_finder = CordFinder.new(params[:location])
    # forecast = ForecastFinder.new(cord_finder)
    image = ImageFinder.new(cord_finder)
    render json: cord_finder
  end

end
