get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:user' do

  @user = TwitterUser.find_by_username(params[:user])

  @user = Twitter.user(params[:username])
  
  @tweets = tweet_cache(@user)

  erb :tweets


end