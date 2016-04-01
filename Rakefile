require "sinatra/activerecord/rake"
require "./dank_memes"

namespace :db do
  task :populate_memes do
    response = HTTParty.get('http://www.reddit.com/r/dankmemes/top.json', verify: false).parsed_response
    
    unless response.nil?
      Meme.destroy_all

      response["data"]["children"].select do|item_hash|
        item_hash["data"]["post_hint"] == "image"
      end.each do |item_hash|
        Meme.create(
          source: :reddit,
          title: item_hash["data"]["title"],
          permalink: item_hash["data"]["permalink"],
          asset_url: item_hash["data"]["url"]
        )
      end
    end
  end
end