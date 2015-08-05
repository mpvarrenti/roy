class LightsController < ApplicationController


  def index
    @lights = Light.all
  end

  def show
    @light = Light.find(params[:id])
  end

  def new
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
