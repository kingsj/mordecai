class BirthdaysController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
  end

  def show
  end

  def new
  end

  def create
  	@birthday = Birthday.new(name: params[:name], day: params[:day])
  	if @birthday.save 
  		flash[:notice] = "Created birthday successfully!"
  		Birthday.email_list(params[:recipients]).each do |recipient|
  			WishMailer.wish_email(recipient, params[:name], params[:day]).deliver
  		end
  	else 
  		flash[:alert] = "Unable to create birthday!"
  	end
  	redirect_to '/admin'
  end
end
