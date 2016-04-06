require "sinatra"
require "sinatra/activerecord"
require "./models"
require "./parser"

set :database, "sqlite3:dank_memes.db"

get "/" do
  @title = "Dank Memes"
  @memes = Meme.order(asset_created_at: :desc)
  erb :home
end

