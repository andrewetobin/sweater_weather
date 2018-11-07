class Api::V1::BackgroundsController < ApplicationController

  def index
    cord_finder = CordFinder.new(params[:location])
    image = ImageFinder.new(cord_finder)
    
    render json: image
  end

end
