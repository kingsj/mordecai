class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :trackable, :validatable

  validates :email, 
  :format => {:with => /\A.+@ixperience.co.za\z/i,
  	:message => ": You must be an employee of iXperience to use GroupWish!"}
  #,
  #  
end
