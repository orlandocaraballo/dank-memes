class AddDateToMemes < ActiveRecord::Migration
  def change
    add_column :memes, :asset_created_at, :datetime
  end
end
