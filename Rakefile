require "sinatra/activerecord/rake"
require "./dank_memes"

namespace :meme do
  desc "Wipes db of memes"
  task :wipe do
    Meme.destroy_all
  end

  desc "Gets reddit memes from many subreddits"
  task :all_reddit do
    %w(memes dankmemes meme adviceanimals).each do |subreddit|
      Rake::Task["meme:reddit"].invoke(subreddit)
      Rake::Task["meme:reddit"].reenable
    end
  end

  desc "Gets reddit memes from many subreddits"
  task :all_tumblr do
    %w(iiidlehands).each do |blog|
      Rake::Task["meme:tumblr"].invoke(blog)
    end
  end

  desc "Gets reddit memes from a subreddit"
  task :reddit, [:subreddit] do |task, args|
    Parser.new.reddit(args.subreddit).each do |item_hash|
      Meme.create(
        source: :reddit,
        protocol: :http,
        domain: "reddit.com",
        title: item_hash["data"]["title"],
        permalink: item_hash["data"]["permalink"],
        asset_url: item_hash["data"]["url"],
        asset_type: :image,
        asset_created_at: Time.at(item_hash["data"]["created"].to_i)
      )
    end
  end

  desc "Gets all tumblr memes"
  task :tumblr, [:blog] do |task, args|
    Parser.new.tumblr(args.blog).each do |item_hash|
      Meme.create(
        source: :tumblr,
        protocol: :http,
        domain: "#{args.blog}.tumblr.com",
        title: item_hash["source_title"],
        permalink: item_hash["post_url"],
        asset_url: item_hash["photos"][0]["original_size"]["url"],
        asset_type: :image,
        asset_created_at: item_hash["date"]
      )
    end
  end
end