class BuildingsController < ApplicationController


    @jumbo_h1 = ""
    @jumbo_p = ""

  def index
    @jumbo_h1 = "All Buildings..."
    @jumbo_p = "Yep, this is all of 'em."
    @buildings = Building.all
  end

  def show
    @building = Building.find params[:id]
    @options = Option.all.where building_id:@building.id
    @jumbo_h1 = @building.address
    @jumbo_p = "This is some sort of place where people live or work or something."
  end

  def new
    @jumbo_h1 = "Creating a new Building..."
    @jumbo_p = "Entering a new building, eh?."

  end

  def create
    # render plain: params[:building].inspect
    @building = Building.new
    @building.address = params[:building][:address]
    @building.save
    redirect_to @building
  end

  def destroy
    building = Building.find params[:id]
    building.destroy
    redirect_to buildings_path
  end





end
