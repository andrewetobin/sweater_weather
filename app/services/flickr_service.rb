class FlickrService

  def initialize(lat, lon)
    @lat = lat
    @lon = lon
  end

  def info
    JSON.parse(response.body, symbolize_names: true)
  end

  def response
    conn.get("/services/rest/?method=flickr.photos.search&api_key=#{ENV['flickr_key']}&lat=#{@lat}&lon=#{@lon}&tags=park,building&format=json&nojsoncallback=1")
  end

  def conn
    Faraday.new(url: "https://api.flickr.com") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end





end
