class WishesController < ApplicationController
  def create
  	logger.debug "HELLO"
    logger.debug params[:message]
    logger.debug params[:author]
    @wish = Wish.new(message: params[:message], author: params[:author])
  	if @wish.save
  		flash[:notice] = "Wish created successfully"
  	else 
  		flash[:alert] = "Wish could not be created."
  	end
  	render 'new'
  end

  def new
  	@wishes = Wish.all
  end
end
