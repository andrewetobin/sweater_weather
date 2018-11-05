class DarkSkyService

  def initialize(coordinates)
    @coordinates = coordinates
  end

  def info
    JSON.parse(response.body, symbolize_names: true)
  end

  def response
    conn.get("/forecast/#{ENV['dark_sky_key']}/#{@coodinates}")
  end

  def conn
    Faraday.new(url: "https://api.darksky.net") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

end
