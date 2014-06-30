class WishesController < ApplicationController
  def create
    @wish = Wish.new(message: params[:message], author: params[:author], birthday_id: params[:birthday_id])
  	if @wish.save
  		flash[:notice] = "Wish created successfully"
  	else 
  		flash[:alert] = "Wish could not be created."
  	end
  	redirect_to '/wishes/new'
  end

  def new
  	@wishes = Wish.all
  end
end
