class CordFinder
  attr_reader :coordinates, :formatted_address

  def initialize(location)
    @location = location
    @info = service.info
  end

  def coordinates
    @info[:results][0][:geometry][:location].values
  end

  def formatted_address
    @info[:results][0][:formatted_address]
  end

  private

    def service
      GoogleService.new(@location)
    end



end
