class Weather
  attr_reader :max_temp,
              :min_temp,
              :temp,
              :detailed_description,
              :main_description
  def initialize(data)
    @max_temp = data[:main][:temp_max]
    @min_temp = data[:main][:temp_min]
    @temp = data[:main][:temp]
    @detailed_description = data[:weather][0][:description]
    @main_description = data[:weather][0][:main]
  end

  def date
    Date.today.strftime('%A, %B %d')
  end
end
