class CurrentSerializer < ActiveModel::Serializer
  attributes :current_time, :current_temperature, :current_summary, :icon, :high, :low

  def current_time
    Time.at(object[:currently][:time])
  end

  def current_temperature
    object[:currently][:temperature].round
  end

  def current_summary
    object[:currently][:summary]
  end

  def icon
    object[:currently][:icon]
  end

  def high
    object[:daily][:data][0][:temperatureHigh].round
  end

  def low
    object[:daily][:data][0][:temperatureLow].round
  end

end
