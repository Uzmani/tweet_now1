helpers do 

  def tweet_cache(twitter_user)
    @tweets = []
    Twitter.user_timeline(twitter_user).each do |tweet|
      @tweets << tweet.text
    end
    @tweets
  end

end
