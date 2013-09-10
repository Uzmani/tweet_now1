class TwitterUser < ActiveRecord::Base
  has_many :tweets
  # Remember to create a migration!

  def tweets_stale?
    (Time.now - self.tweets.first.created_at)/60 - 420 > self.determine_avg ? true : false
  end

  def fetch_tweets
    @tweets = self.tweet_cache
    @tweets.each do |tweet|
        self.tweets << Tweet.create(:text => tweet.text)
    end   
  end


  def tweet_cache
    @tweets = []
    Twitter.user_timeline(self.username).take(10).each do |tweet|
      @tweets << tweet
    end
  end


  def determine_avg
    tweets = Twitter.user_timeline(self).take(5)
    times = []
    tweets.each do |t|
      times << t.attrs[:created_at].to_time.to_i
    end

    (times[0]-times[4])/60
  end


end
