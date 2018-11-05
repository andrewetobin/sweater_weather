class ForcastFinder

  def initialize(coordinates)
    @coordinates = coordinates
    @info = service.info
  end

  private

    def service 
      DarkSkyService.new(@coodinates)
    end




end
