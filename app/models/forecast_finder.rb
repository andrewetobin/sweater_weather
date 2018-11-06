class ForecastFinder
  attr_reader :info, :coordinates, :formatted_address

  def initialize(cord_finder)
    @coordinates = cord_finder.coordinates.join(",")
    @formatted_address = cord_finder.formatted_address
    @info = service.info
  end

  private

    def service
      DarkSkyService.new(@coordinates)
    end




end
