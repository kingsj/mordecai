class AddBackgroundToBirthdays < ActiveRecord::Migration
  def change
    add_column :birthdays, :background, :string
  end
end
