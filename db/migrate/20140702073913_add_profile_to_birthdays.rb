class AddProfileToBirthdays < ActiveRecord::Migration
  def change
    add_column :birthdays, :profile, :string
  end
end
