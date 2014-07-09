class BirthdaysController < ApplicationController
  # skip_before_action  :verify_authenticity_token
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :set_birthday, only: [:edit, :show, :update, :destroy, :mail, :deliver]

  def columns(n) 
    if n == 0 
      return [""]
    end
    col = []
    n.times do
      col << "col-md-6"
    end
    if n % 2 != 0 
      col[-1] = "col-md-12"
    end
    col
  end

  def edit
  end

  def destroy
    if @birthday.delete
      flash[:notice] = "Birthday deleted successfully"
    else
      flash[:error] = "Birthday could not be deleted"
    end
    redirect_to root_path
  end

  def update
    @birthday.update(birthday_params)
    redirect_to root_path
  end

  def index
    @birthdays = Birthday.all.order("day DESC")
    # hashes = @birthdays.to_a.map(&:serializable_hash)

    @columns = columns(@birthdays.size)
  end

  def show
    render 'show', layout: 'show_birthday'
  end

  def new
    @user = current_user
    @birthday = Birthday.new
  end

  def create
    @recipients = Birthday.email_list(params[:recipients])
  	@birthday  = Birthday.new( birthday_params.merge({ wisher_count: @recipients.size }))
  	if @birthday.save 
  		flash[:notice] = "Created birthday successfully!"
  		@recipients.each_with_index do |recipient, index|
  			WishMailer.wish_email(recipient, @birthday, index).deliver
  		end
  	else 
  		flash[:alert] = "Unable to create birthday!"
  	end
  	redirect_to '/admin'
  end

  def mail 
  end

  def pluralize(count, noun)
    if count != 0
      count == 1 ? "#{count} #{noun}" : "#{count} #{noun.pluralize}"
    end
  end

  def deliver
    @recipients = Birthday.email_list(params[:recipients])
    @birthday.wisher_count += @recipients.size
    @birthday.save
    word = pluralize(@recipients.size, "recipient")
    flash[:notice] = "Delivered mail to #{word}!"
    @recipients.each_with_index do |recipient, index|
        WishMailer.wish_email(recipient, @birthday, index + @birthday.wisher_count).deliver
    end
    redirect_to birthdays_path
  end

  private 
    def birthday_params
      params.require(:birthday).permit(:name, :day, :age, :font_color, 
        :background, :background_file_name, :background_content_type, :background_file_size, :background_updated_at,
        :profile, :profile_file_name, :profile_content_type, :profile_file_size, :background_updated_at)
    end

    def set_birthday
      @birthday = Birthday.find(params[:id])
    end
end
