class Giphy
  attr_reader :embed_url
  def initialize(data)
    @embed_url = data[:data][0][:embed_url]
  end
end
