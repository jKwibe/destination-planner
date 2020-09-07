class WeatherService
  def self.weather_info(zipcode, units = 'imperial')
    JSON.parse(get_weather(zipcode, units).body, symbolize_names: true)
  end

  private


  def self.get_weather(zipcode, units)
    conn.get('weather') do |f|
      f.params[:zip] = "#{zipcode},us"
      f.params[:units] = units
    end
  end

  def self.conn
    Faraday.new('https://api.openweathermap.org/data/2.5/') do |f|
      f.params[:appid] = ENV['WEATHER_API']
    end
  end
end
