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
    object[:temperatureHigh]
  end

  def low
    object[:temperatureLow]
  end

  def precip
    (object[:precipProbability]*100).to_s << " %"
  end
end
