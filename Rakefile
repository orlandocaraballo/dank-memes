require "sinatra/activerecord/rake"
require "./dank_memes"

namespace :meme do
  task :reddit do
    response = HTTParty.get("http://www.reddit.com/r/dankmemes/top.json", verify: false).parsed_response
    
    unless response.nil?
      Meme.destroy_all

      response["data"]["children"].select do|item_hash|
        item_hash["data"]["post_hint"] == "image"
      end.each do |item_hash|
        Meme.create(
          source: :reddit,
          protocol: :https,
          domain: "reddit.com",
          title: item_hash["data"]["title"],
          permalink: item_hash["data"]["permalink"],
          asset_url: item_hash["data"]["url"],
          asset_type: :image
        )
      end
    end
  end

  task :tumblr do
    response = HTTParty.get("http://mindvsspirit.tumblr.com/api/read", verify: false).parsed_response

    p response["tumblr"]["tumblelog"]
  end
end