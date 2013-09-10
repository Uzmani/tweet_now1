get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/user' do

  @user = TwitterUser.find_by_username(params[:username])
p params
    if  @user.nil? || @user.tweets.length == 0  
      @user = TwitterUser.create(:username => params[:username])
      @user.fetch_tweets
    elsif @user.tweets_stale?
      @user.tweets.destroy_all
      @user.fetch_tweets 
    end
  

  @tweets = @user.tweets.order("id ASC")
  @user = Twitter.user(params[:username])

  erb :tweets, layout: false

end



get '/loading' do 
  erb :_loading, layout: false
end