class DetailsSerializer < ActiveModel::Serializer
  attributes :current_summary, :icon, :today, :tonight, :feels_like, :humidity, :visibility, :UV_Index

  def current_summary
    object[:currently][:summary]
  end

  def icon
    object[:currently][:icon]
  end

  def today
    object[:daily][:data][0][:summary]
  end

  def tonight
    object[:daily][:data][1][:summary]
  end

  def feels_like
    object[:currently][:apparentTemperature].round
  end

  def humidity
    ((object[:currently][:humidity]*100).round).to_s << "%"
  end

  def visibility
    object[:currently][:visibility].to_s << " mile(s)"
  end

  def UV_Index
    object[:currently][:uvIndex]
  end
end
