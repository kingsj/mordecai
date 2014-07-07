class AddWisherCountToBirthdays < ActiveRecord::Migration
  def change
    add_column :birthdays, :wisher_count, :integer, default: 0
  end
end
