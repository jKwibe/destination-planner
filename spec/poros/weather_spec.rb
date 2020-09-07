require 'rails_helper'

RSpec.describe Weather do
  it 'should ' do
    data = JSON.parse(File.read('spec/data/weather_data.json'), symbolize_names: true)
    weather = Weather.new(data)
    expect(weather).to be_instance_of(Weather)
    expect(weather.max_temp).to eq(78.01)
    expect(weather.min_temp).to eq(66)
    expect(weather.temp).to eq(72.25)
    expect(weather.detailed_description).to eq("few clouds")
    expect(weather.main_description).to eq("Clouds")
  end
end
