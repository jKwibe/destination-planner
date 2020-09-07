class GiphyService
  def self.giphy_image(weather_description)
    JSON.parse(data(weather_description).body, symbolize_names: true)
  end

  def self.data(weather_description)
    conn.get('search') do |f|
      f.params[:q] = weather_description
      f.params[:limit] = 1
      f.params[:offset] = 0
      f.params[:rating] = 'g'
      f.params[:lang] = 'en'
    end
  end

  def self.conn
    Faraday.new('https://api.giphy.com/v1/stickers/') do |f|
      f.params[:api_key] = 're12emMamNIBklzNNYoP2wB0vrBWZEcB'
    end
  end
end
