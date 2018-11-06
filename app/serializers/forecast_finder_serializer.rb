class ForecastFinderSerializer < ActiveModel::Serializer
  attributes :location, :currently, :details, :forecast

  def location
    object.formatted_address
  end

  def currently
    [{
      "current_time" => Time.at(object.info[:currently][:time]),
      "current_temperature" => object.info[:currently][:temperature].round,
      "current_summary" => object.info[:currently][:summary],
      "icon" => object.info[:currently][:icon],
      "high" => object.info[:daily][:data][0][:temperatureHigh].round,
      "low" => object.info[:daily][:data][0][:temperatureLow].round
    }
    ]
  end

  def details
    [{
      "current_summary" => object.info[:currently][:summary],
      "icon" => object.info[:currently][:icon],
      "today" => object.info[:daily][:data][0][:summary],
      "tonight" => object.info[:daily][:data][1][:summary],
      "feels_like" => object.info[:currently][:apparentTemperature].round,
      "humidity" => ((object.info[:currently][:humidity])*100).to_s << " %",
      "visibility" => object.info[:currently][:visibility].to_s << " mile(s)",
      "UV Index" => object.info[:currently][:uvIndex]
    }
    ]
  end

  def forecast
    [
      {"day" => Time.at(object.info[:daily][:data][1][:time]),
      "icon" => object.info[:daily][:data][1][:icon],
      "high" => object.info[:daily][:data][1][:temperatureHigh].round,
      "low" => object.info[:daily][:data][1][:temperatureLow].round,
      "precip" => ((object.info[:daily][:data][1][:precipProbability])*100).to_s << " %",
    },
      {"day" => Time.at(object.info[:daily][:data][2][:time]),
      "icon" => object.info[:daily][:data][2][:icon],
      "high" => object.info[:daily][:data][2][:temperatureHigh].round,
      "low" => object.info[:daily][:data][2][:temperatureLow].round,
      "precip" => ((object.info[:daily][:data][2][:precipProbability])*100).to_s << " %",
    },
      {"day" => Time.at(object.info[:daily][:data][3][:time]),
      "icon" => object.info[:daily][:data][3][:icon],
      "high" => object.info[:daily][:data][3][:temperatureHigh].round,
      "low" => object.info[:daily][:data][3][:temperatureLow].round,
      "precip" => ((object.info[:daily][:data][3][:precipProbability])*100).to_s << " %",
    },
      {"day" => Time.at(object.info[:daily][:data][4][:time]),
      "icon" => object.info[:daily][:data][4][:icon],
      "high" => object.info[:daily][:data][4][:temperatureHigh].round,
      "low" => object.info[:daily][:data][4][:temperatureLow].round,
      "precip" => ((object.info[:daily][:data][4][:precipProbability])*100).to_s << " %",
    },
      {"day" => Time.at(object.info[:daily][:data][5][:time]),
      "icon" => object.info[:daily][:data][5][:icon],
      "high" => object.info[:daily][:data][5][:temperatureHigh].round,
      "low" => object.info[:daily][:data][5][:temperatureLow].round,
      "precip" => ((object.info[:daily][:data][5][:precipProbability])*100).to_s << " %",
    }
    ]
  end




end
