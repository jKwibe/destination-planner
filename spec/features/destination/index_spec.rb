require 'rails_helper'

RSpec.describe 'Shows All Destinations', type: :feature do
  before(:each) do
    @destination1 = create(:destination)
    @destination2 = create(:destination)
  end
  it 'should ' do
    #create destination
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
    visit destination_path(@destination1)
    expect(page).to have_content('Temperature')
    expect(page).to have_content('High')
    expect(page).to have_content('Low')
  end
end

# As a user
# When I visit "/"
# And I click on a destination
# Then I should be on page "/destinations/:id"
# Then I should see the destination's name, zipcode, description, and current weather
# The weather forecast is specific to the destination whose page I'm on
# The forecast should include date (weekday, month and day), current, high and low temps in Fahrenheit, and a summary (for example "light rain", "clear sky", etc.)