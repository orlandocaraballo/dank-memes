class AddAssetSubcategoryToMemes < ActiveRecord::Migration
  def change
    add_column :memes, :source_url, :string
  end
end
