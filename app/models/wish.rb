class Wish < ActiveRecord::Base
	belongs_to :birthday

	def self.unique_wish(birthday_id, wisher_id)
		birthday = Birthday.find(birthday_id)
		birthday.wishes.each do |wish|
			if wish.wisher_id == wisher_id
				return false
			end
		end	
		true
	end

end
