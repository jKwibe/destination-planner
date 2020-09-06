require 'rails_helper'

RSpec.describe Weather do
  it 'should ' do
    data = {
        "coord": {
            "lon": -104.97,
            "lat": 39.76
        },
        "weather": [
            {
                "id": 801,
                "main": "Clouds",
                "description": "few clouds",
                "icon": "02n"
            }
        ],
        "base": "stations",
        "main": {
            "temp": 72.25,
            "feels_like": 65.3,
            "temp_min": 66,
            "temp_max": 78.01,
            "pressure": 1023,
            "humidity": 26
        },
        "visibility": 10000,
        "wind": {
            "speed": 6.93,
            "deg": 200
        },
        "clouds": {
            "all": 20
        },
        "dt": 1599375576,
        "sys": {
            "type": 1,
            "id": 3449,
            "country": "US",
            "sunrise": 1599395595,
            "sunset": 1599441793
        },
        "timezone": -21600,
        "id": 0,
        "name": "Denver",
        "cod": 200
    }
    weather = Weather.new(data)
    expect(weather).to be_instance_of(Weather)
    expect(weather.max_temp).to eq(78.01)
    expect(weather.min_temp).to eq(66)
    expect(weather.temp).to eq(72.25)
    expect(weather.detailed_description).to eq("few clouds")
    expect(weather.main_description).to eq("Clouds")
  end
end
