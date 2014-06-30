class BirthdaysController < ApplicationController
  # skip_before_action  :verify_authenticity_token
  before_action :authenticate_user!, :except => [:index]

  def column(n) 
    if n != 0
      "col-md-" + (12/n).to_s
    else 
      ""
    end
  end

  def index
    @birthdays = Birthday.all
    @column = column(@birthdays.size)
  end

  def show
  end

  def new
    @user = current_user
    @birthday = Birthday.new
  end

  def create
  	@birthday = Birthday.new( birthday_params )
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

  private 
    def birthday_params
      params.require(:birthday).permit(:name, :day, :background, :profile)
    end
end
