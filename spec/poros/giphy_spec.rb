require 'rails_helper'

RSpec.describe Giphy do
  it 'should ' do
    data = JSON.parse(File.read('spec/data/giphy_data.json'), symbolize_names: true)
    giphy_img = Giphy.new(data)
    expect(giphy_img.embed_url).to eq(data[:data][0][:embed_url])
  end
end
