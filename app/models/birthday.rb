class Birthday < ActiveRecord::Base
	def self.email_list(emails)
		emails.split(',').map { |email| email.strip }
	end
end
