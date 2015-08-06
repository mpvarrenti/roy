class CompareController < ApplicationController
  def index
    @jumbo_h1 = "New Comparison"
    @jumbo_p = "Time to input some options..."
  end


  def show
    @jumbo_h1 = "New Comparison"
    @jumbo_p = "Time to imput some options"
  end

  # recursive use of update action once building is picked
  def update

    if params[:building]
      @building = Building.find params[:building][:id]
    elsif params[:comparison]
      @building = Building.find params[:comparison][:building_id]
      if params[:comparison][:option_a_id]
        @option_a = Option.find params[:comparison][:option_a_id]
      end
      if params[:comparison][:option_b_id]
        @option_b = Option.find params[:comparison][:option_b_id]
      end
    else
      @building = false
    end

    if @option_a && @option_b
      @roi = @option_a.pa - @option_b.pa - @option_b.installation
    end

  end

end
