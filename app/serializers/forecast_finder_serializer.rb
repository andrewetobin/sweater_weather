class ForecastFinderSerializer < ActiveModel::Serializer
  attributes :location, :currently, :details, :hourly, :forecast

  def location
    # if object.formatted_address.split.length > 7
    #
    require "pry"; binding.pry
    object.formatted_address
  end

  def currently
    CurrentSerializer.new(object.info).attributes
  end

  def details
    DetailsSerializer.new(object.info).attributes
  end

  def hourly
    object.info[:hourly][:data][0..7].map do |hour|
      HourlySerializer.new(hour).attributes
    end
  end

  def forecast
    object.info[:daily][:data][1..5].map do |day|
      DailySerializer.new(day).attributes
    end
  end




end
