class ForecastFinder
  attr_reader :info, :coordinates, :formatted_address

  def initialize(cord_finder)
    if cord_finder.class == String
      @coordinates = cord_finder
    else
      @coordinates = cord_finder.coordinates.join(",")
    end
    @formatted_address = cord_finder.formatted_address
    @info = service.info
  end

  private

    def service
      DarkSkyService.new(@coordinates)
    end




end
