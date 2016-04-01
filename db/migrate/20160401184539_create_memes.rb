class CreateMemes < ActiveRecord::Migration
  def change
    create_table :memes do |table|
      table.string :source
      table.string :title
      table.string :permalink
      table.string :asset_url
    end
  end
end
