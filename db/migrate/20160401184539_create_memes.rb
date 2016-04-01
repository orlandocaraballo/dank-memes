class CreateMemes < ActiveRecord::Migration
  def change
    create_table :memes do |t|
      t.string :source
      t.string :title
      t.string :permalink
      t.string :asset_url
    end
  end
end
