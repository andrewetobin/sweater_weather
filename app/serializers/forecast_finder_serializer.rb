class ForecastFinderSerializer < ActiveModel::Serializer
  attributes :location, :currently, :details

  def location
    object.formatted_address
  end

  def currently
    [{
      "current_time" => Time.at(object.info[:currently][:time]),
      "current_temperature" => object.info[:currently][:temperature].round,
      "current_summary" => object.info[:currently][:summary],
      "high" => object.info[:daily][:data][0][:temperatureHigh].round,
      "low" => object.info[:daily][:data][0][:temperatureLow].round
    }
    ]
  end

  def details
    [{
      "current_summary" => object.info[:currently][:summary],
      "today" => object.info[:daily][:data][0][:summary],
      "tonight" => object.info[:daily][:data][1][:summary],
      "feels_like" => object.info[:currently][:apparentTemperature].round,
      "humidity" => ((object.info[:currently][:humidity])*100).to_s << " %",
      "visibility" => object.info[:currently][:visibility].to_s << " mile(s)",
      "UV Index" => object.info[:currently][:uvIndex]
    }
    ]
  end


end
