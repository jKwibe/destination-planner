class DestinationFacade
  attr_reader :detailed_description,
              :min_temp,
              :max_temp,
              :date
  def initialize(weather)
    @min_temp = weather.min_temp
    @max_temp = weather.max_temp
    @date = weather.date
    @detailed_description = weather.detailed_description
    @giphy = Giphy.new(GiphyService.giphy_image(@detailed_description))
  end

  def embed_giphy_url
    @giphy.embed_url
  end
end
