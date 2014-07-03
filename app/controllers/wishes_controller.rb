class WishesController < ApplicationController
  def create
  	if Wish.unique_wish(params[:birthday_id], params[:wisher_id])
  		@wish = Wish.create(message: params[:message], author: params[:author], birthday_id: params[:birthday_id], wisher_id: params[:wisher_id])
  		flash[:notice] = "Wish created successfully!"
  	else 
  		flash[:alert] = "Oops, looks like you've already submitted a wish!"
  	end
  end

end
