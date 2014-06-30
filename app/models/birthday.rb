class Birthday < ActiveRecord::Base
	attr_accessible :background_file_name
	has_attached_file :background, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :background, :content_type => /\Aimage\/.*\Z/

  	attr_accessible :profile_file_name
  	has_attached_file :profile, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :profile, :content_type => /\Aimage\/.*\Z/	
  

	def self.email_list(emails)
		emails.split(',').map { |email| email.strip }
	end
end
