enable :sessions


get '/' do
  p session[:user_id]
  if session[:user_id]
    @user = User.find(session[:user_id])
    erb :list_decks
  else
    redirect '/login'
  end
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
  session[:user_id] = User.find_by_email(params[:user][:email]).id
  p session
  redirect '/'
end

get '/logout' do
  session.clear
  redirect '/'
end
