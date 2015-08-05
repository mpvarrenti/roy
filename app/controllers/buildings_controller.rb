class BuildingsController < ApplicationController



  def index
    @buildings = Building.all
  end

  def show
    @building = Building.find(params[:id])
  end

  def new
  end

  def create
    # render plain: params[:building].inspect
    @building = Building.new
    @building.address = params[:building][:address]
    @building.save
    redirect_to @building
  end

  def destroy
    building = Building.find(params[:id])
    building.destroy
    redirect_to buildings_path
  end


  def layouts
    @layouts = Layout.where(building_id = params[:id] )


  end





end
