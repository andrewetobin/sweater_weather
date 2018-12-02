class HourlySerializer < ActiveModel::Serializer
  attributes :time, :icon, :temperature

  def time
    time = Time.at(object[:time])
    time.strftime("%l %P")
  end

  def icon
    object[:icon]
  end

  def temperature
    object[:temperature].round
  end

end
