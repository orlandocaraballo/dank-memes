class AddColumnsToMemes < ActiveRecord::Migration
  def change
    change_table :memes do |t|
      t.string :domain
      t.string :protocol
      t.string :asset_type
    end
  end
end
