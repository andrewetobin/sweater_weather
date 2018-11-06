class ImageFinder
  attr_reader :info

  def initialize(cord_finder)
    @lat = cord_finder.coordinates[0]
    @lon = cord_finder.coordinates[1]
    @info = service.info
  end

  private

    def service
      FlickrService.new(@lat, @lon)
    end



end
