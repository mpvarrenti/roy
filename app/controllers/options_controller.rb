class OptionsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @building = Building.find(params[:building][:id])
  end
end
