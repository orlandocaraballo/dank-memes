require "sinatra"
require "sinatra/activerecord"
require "./models"
require "./parser"

set :database, "sqlite3:dank_memes.db"

get "/" do
  @title = "Dank Memes"
  @memes = Meme.all
  erb :home
end