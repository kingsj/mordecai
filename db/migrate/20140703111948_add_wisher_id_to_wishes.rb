class AddWisherIdToWishes < ActiveRecord::Migration
  def change
    add_column :wishes, :wisher_id, :integer
  end
end
