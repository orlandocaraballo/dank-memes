require "httparty"
require "tumblr_client"
require "yaml"

class Parser
  def initialize
    Tumblr.configure do |config|
      config.consumer_key = ENV["TUMBLR_CONSUMER_KEY"]
      config.consumer_secret = ENV["TUMBLR_CONSUMER_SECRET"]
      config.oauth_token = ENV["TUMBLR_TOKEN"]
      config.oauth_token_secret = ENV["TUMBLR_TOKEN_SECRET"]
    end
  end

  def reddit(subreddit)
    response = HTTParty.get(
      "http://www.reddit.com/r/#{subreddit}/top.json", 
      verify: false
    ).parsed_response
    
    response["data"]["children"].select do |item_hash|
      item_hash["data"]["post_hint"] == "image"
    end
  end

  def tumblr(blog)
    Tumblr::Client.new.posts("#{blog}.tumblr.com", type: :photo, tag: :memes)["posts"]
  end
end