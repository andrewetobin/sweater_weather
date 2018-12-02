class DailySerializer < ActiveModel::Serializer
  attributes :day, :icon, :high, :low, :precip

  def day
    time = Time.at(object[:time])
    time.strftime("%A")
  end

  def icon
    object[:icon]
  end

  def high
    "#{object[:temperatureHigh].round}\xC2\xB0"
  end

  def low
    "#{object[:temperatureLow].round}\xC2\xB0"
  end

  def precip
    (object[:precipProbability]*100).to_s << " %"
  end
end
