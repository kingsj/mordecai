class CreateBirthdays < ActiveRecord::Migration
  def change
    create_table :birthdays do |t|
      t.string :name
      t.date :day
      t.integer :age
      t.string :font_color

      t.timestamps
    end
  end
end
