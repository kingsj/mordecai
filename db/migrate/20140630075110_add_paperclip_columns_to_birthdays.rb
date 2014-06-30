class AddPaperclipColumnsToBirthdays < ActiveRecord::Migration
  def change
  	add_attachment :birthdays, :background
  	add_attachment :birthdays, :profile
  end
end
