require "httparty"

class Parser
  def initialize
  end

  def go
    response = HTTParty.get('http://www.reddit.com/r/dankmemes/top.json', verify: false).parsed_response
    response["data"]["children"].select do|item|
      item["data"]["post_hint"] == "image"
    end.map do |item|
      OpenStruct.new(
        source: :reddit,
        title: item["data"]["title"],
        permalink: item["data"]["permalink"],
        asset_url: item["data"]["url"],
        asset_type: :image
      )
    end
  end
end