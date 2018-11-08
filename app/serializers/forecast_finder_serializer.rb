class ForecastFinderSerializer < ActiveModel::Serializer
  attributes :location, :currently, :details, :forecast

  def location
    object.formatted_address
  end

  def currently
    CurrentSerializer.new(object.info).attributes
  end

  def details
    DetailsSerializer.new(object.info).attributes
  end

  def forecast
    object.info[:daily][:data][1..5].map do |day|
      DailySerializer.new(day).attributes
    end


    # [
    #   {"day" => Time.at(object.info[:daily][:data][1][:time]),
    #   "icon" => object.info[:daily][:data][1][:icon],
    #   "high" => object.info[:daily][:data][1][:temperatureHigh].round,
    #   "low" => object.info[:daily][:data][1][:temperatureLow].round,
    #   "precip" => ((object.info[:daily][:data][1][:precipProbability])*100).to_s << " %",
    # },
    #   {"day" => Time.at(object.info[:daily][:data][2][:time]),
    #   "icon" => object.info[:daily][:data][2][:icon],
    #   "high" => object.info[:daily][:data][2][:temperatureHigh].round,
    #   "low" => object.info[:daily][:data][2][:temperatureLow].round,
    #   "precip" => ((object.info[:daily][:data][2][:precipProbability])*100).to_s << " %",
    # },
    #   {"day" => Time.at(object.info[:daily][:data][3][:time]),
    #   "icon" => object.info[:daily][:data][3][:icon],
    #   "high" => object.info[:daily][:data][3][:temperatureHigh].round,
    #   "low" => object.info[:daily][:data][3][:temperatureLow].round,
    #   "precip" => ((object.info[:daily][:data][3][:precipProbability])*100).to_s << " %",
    # },
    #   {"day" => Time.at(object.info[:daily][:data][4][:time]),
    #   "icon" => object.info[:daily][:data][4][:icon],
    #   "high" => object.info[:daily][:data][4][:temperatureHigh].round,
    #   "low" => object.info[:daily][:data][4][:temperatureLow].round,
    #   "precip" => ((object.info[:daily][:data][4][:precipProbability])*100).to_s << " %",
    # },
    #   {"day" => Time.at(object.info[:daily][:data][5][:time]),
    #   "icon" => object.info[:daily][:data][5][:icon],
    #   "high" => object.info[:daily][:data][5][:temperatureHigh].round,
    #   "low" => object.info[:daily][:data][5][:temperatureLow].round,
    #   "precip" => ((object.info[:daily][:data][5][:precipProbability])*100).to_s << " %",
    # }
    # ]
  end




end
