

post '/tweet' do 
  p params

  Twitter.update(params[:tweet_input])

  erb :index

end