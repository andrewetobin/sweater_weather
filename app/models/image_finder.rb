class ImageFinder
  attr_reader :info

  def initialize(cord_finder)
    @lat = cord_finder.coordinates[0]
    @lon = cord_finder.coordinates[1]
    @info = service.info
  end

  def random
    @info[:photos][:photo][rand(1..(@info[:photos][:perpage]-1))]
  end

  def build_url

  end
# @info[:photos][:photo][0]
  private

    def service
      FlickrService.new(@lat, @lon)
    end



end
