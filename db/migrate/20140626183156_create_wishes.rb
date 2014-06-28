class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.string :author
      t.integer :birthday_id
      t.text :message

      t.timestamps
    end
  end
end
