def authenticate
  redirect '/login' unless session[:user_id]
end