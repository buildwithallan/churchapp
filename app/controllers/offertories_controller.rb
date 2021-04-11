class OffertoriesController < ApplicationController
   def index
     @q = Offertory.ransack(params[:q])
     @pagy, @offertories =pagy(@q.result(distinct: true))
  end

  def new
  	@offertory = Offertory.new
  end

  def create
  	@offertory = Offertory.create(offertory_params)

  	if @offertory.save
  		redirect_to :action => :index
  	else
  		render :new
  	end
  end

  private

  def offertory_params
  	params.require(:offertory).permit(:amount, :description)
  end
end
