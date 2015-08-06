class OptionsController < ApplicationController
  def index
  end

  def show
    @option = Option.find(params[:id])
    @jumbo_h1 = "#{@option.name} Layout Option"
    @jumbo_p = "Prepared for #{@option.building.address}"
  end

  def new
    @building = Building.find(params[:building][:id])
    @jumbo_h1 = "Creating new layout option for #{@building.address}"
    @jumbo_p = ""
  end

  def create
    @option = Option.new
    @option.name = params[:option][:name]
    @option.building_id = params[:option][:building_id]
    @option.save

    redirect_to @option
  end

  def edit
    @option = Option.find params[:id]
    @jumbo_h1 = "Editing #{@option.name} layout option"
    @jumbo_p = "prepared for #{@option.building.address}"
  end

  def update
    @option_light = OptionLight.new
    @option_light.option_id = params[:id]
    @option_light.light_id = params[:light_id]
    @option_light.save

    redirect_to Option.find(params[:id])
    # @option = Option.find(params[:id])

  end

end
