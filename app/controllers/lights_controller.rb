class LightsController < ApplicationController


  def index
    @jumbo_h1 = "All Lights..."
    @jumbo_p = "If you wanted table of data on lights, you've come to the right place."
    @lights = Light.all
  end

  def show
    @light = Light.find(params[:id])
    @jumbo_h1 = @light.name
    @jumbo_p = "Wow, what a bright spark."
  end

  def new
    @jumbo_h1 = "Creating new Light..."
    @jumbo_p = "Bring a little light into the world."
  end

  def create
    # render plain: params[:light].inspect
    @light = Light.new
    @light.name = params[:light][:name]
    @light.watts = params[:light][:watts]
    @light.price = params[:light][:price]
    @light.save
    redirect_to @light
  end

  def destroy
    light = Light.find(params[:id])
    light.destroy
    redirect_to lights_path
  end




end
