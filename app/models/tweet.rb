class Tweet < ActiveRecord::Base
  belongs_to :twitter_user

   def self.fetch_tweets!(username)
    Tweet.where(twitter_user_id: TwitterUser.find_by(username: username).id).destroy_all
    $client.user_timeline(username, {count: 10})
  end


end