enable :sessions


get '/' do
  @decks = Deck.all
  erb :index
end

get '/register' do
  erb :register
end

post '/register' do
  new_user = User.new(email: params[:user][:email])
  new_user.password = params[:user][:password]
  new_user.save!
  redirect '/register'
end

get '/login' do
  erb :login
end

post '/login' do
  session[:user] = User.find_by_email(params[:user][:email])
  redirect '/'
end
