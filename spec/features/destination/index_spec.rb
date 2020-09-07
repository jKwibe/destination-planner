# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Shows All Destinations', type: :feature do
  before(:each) do
    @destination1 = create(:destination, zip: '80205')
    @destination2 = create(:destination)

    @data = File.read('spec/data/weather_data.json')
    @giphy_data = File.read('spec/data/giphy_data.json')
    stub_request(:get, "https://api.openweathermap.org/data/2.5/weather?appid=#{ENV['WEATHER_API']}&units=imperial&zip=#{@destination1.zip},us").to_return(status: 200, body: @data)
    stub_request(:get, "https://api.giphy.com/v1/stickers/search?api_key=re12emMamNIBklzNNYoP2wB0vrBWZEcB&lang=en&limit=1&offset=0&q=few%20clouds&rating=g").to_return(status: 200, body: @giphy_data)

        end
  it 'should ' do
    visit '/'
    within "#destination-#{@destination1.id}" do
      click_link 'Show'
    end
    expect(current_path).to eq(destination_path(@destination1))
    expect(page).to have_content(@destination1.name)
    expect(page).to have_content(@destination1.zip)
    expect(page).to have_content(@destination1.description)

    expect(page).to_not have_content(@destination2.zip)
    expect(page).to_not have_content(@destination2.description)
  end

  it 'have forecast' do
    weather = Weather.new(JSON.parse(@data, symbolize_names: true))
    date = 'Sunday, September 1'
    allow_any_instance_of(Weather).to receive(:date).and_return(date)

    visit destination_path(@destination1)
    expect(page).to have_content('Temperature')
    expect(page).to have_content("High: #{weather.max_temp}")
    expect(page).to have_content("Low: #{weather.min_temp}")
    expect(page).to have_content(weather.detailed_description)
    expect(page).to have_content(date)
  end
end
