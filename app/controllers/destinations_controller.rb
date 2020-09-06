class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show, :edit, :update, :destroy]

  def index
    @destinations = Destination.all
  end

  def show
    conn = Faraday.new('https://api.openweathermap.org/data/2.5/') do |f|
      f.params[:appid] = ENV['WEATHER_API']
    end

    #TODO make response dynamic
    response = conn.get('weather') do |f|
      f.params[:zip] = '80205,us'
      f.params[:units] = 'imperial'
    end

    data = JSON.parse(response.body, symbolize_names: true)
    #TODO make a weather poro
    @weather = Weather.new(data)
  end

  def new
    @destination = Destination.new
  end

  def edit
  end

  def create
    @destination = Destination.new(destination_params)
    if @destination.save
      redirect_to @destination, notice: 'Destination was successfully created.'
    else
      render :new
    end
  end

  def update
    if @destination.update(destination_params)
      redirect_to @destination, notice: 'Destination was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @destination.destroy
    redirect_to destinations_path, notice: 'Destination was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_destination
    @destination = Destination.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def destination_params
    params.require(:destination).permit(:name, :zip, :description, :image_url)
  end
end
