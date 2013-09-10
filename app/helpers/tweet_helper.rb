helpers do 

  def tweet_cache(twitter_user)
    @tweets = []
    Twitter.user_timeline(twitter_user.username).take(10).each do |tweet|
      @tweets << tweet
    end
  end




end


