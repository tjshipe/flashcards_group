get '/' do
  authenticate
  @user = User.find(session[:user_id])
  redirect "/decks"
end

get '/register' do
  erb :register
end

post '/register' do
  new_user = User.new(email: params[:user][:email])
  new_user.password = params[:user][:password]
  new_user.save!
  session[:user_id] = new_user.id
  redirect '/'
end

get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by_email(params[:user][:email]) || User.new
  if user.password == params[:user][:password]
    session[:user_id] = user.id
    redirect '/'
  else
    erb :login
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
