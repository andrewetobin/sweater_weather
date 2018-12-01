class GoogleService

  def initialize(location)
    @location = location
  end

  def info
    JSON.parse(response.body, symbolize_names: true)
  end

  def response
    if @location.to_i == 0
      conn.get("/maps/api/geocode/json?address=#{@location}&key=#{ENV['google_key']}")
    else
      conn.get("/maps/api/geocode/json?latlng=#{@location}&key=#{ENV['google_key']}")
    end

  end

  def conn
    Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

end
