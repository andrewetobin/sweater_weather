class HourlySerializer < ActiveModel::Serializer
  attributes :time, :icon, :temperature

  def time
    Time.at(object[:time])
  end

  def icon
    object[:icon]
  end

  def temperature
    object[:temperature]
  end

end
