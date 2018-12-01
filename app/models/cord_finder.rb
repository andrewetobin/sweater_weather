class CordFinder
  attr_reader :coordinates, :formatted_address, :info

  def initialize(location)
    @location = location
    @info = service.info
  end

  def coordinates
    @info[:results][0][:geometry][:location].values
  end

  def formatted_address
    if @info[:results][0][:formatted_address].split.length > 6
      "#{@info[:results][0][:address_components][2][:long_name]}, #{@info[:results][0][:address_components][4][:short_name]}"
    else
      split = @info[:results][0][:formatted_address].split(",")
      "#{split[0]},#{split[1]}"
    end
  end

  private

    def service
      GoogleService.new(@location)
    end



end
