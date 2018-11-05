class GoogleService

  def initialize(location)
    @location = location
  end

  def info
    JSON.parse(response.body, symbolize_names: true)
  end

  def response
    conn.get("/maps/api/geocode/json?address=#{@location}&key=#{ENV['google_key']}")
  end

  def conn
    Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

end
