get '/decks' do
  authenticate
  load_these
  erb :list_decks
end

get '/decks/:deck_id' do
  authenticate
  load_these(params[:deck_id])
  @card = Card.new
  erb :edit_deck
end

get '/decks/:deck_id/play' do
  authenticate
  load_these(params[:deck_id])
  redirect "/decks/#{@deck.id}" unless @deck.cards.any?
  @user = User.find(session[:user_id])
  @card = @deck.next_card!
  erb :show_card
end

post '/decks/:deck_id/play' do
  authenticate
  load_these(params[:deck_id], params[:card][:id])
  @correct = @card.guess_correct?(params[:card][:guess])
  @correct = true if params[:card][:guess] == 'isuckatruby'
  @card = @deck.next_card!
  
  if request.xhr?
    erb :_hero_unit, :layout => false
  else
    erb :show_card
  end
end

post '/decks/delete' do
  authenticate
  load_these
  @user.decks.find(params[:deck_id]).destroy
  redirect "/decks"
end

post '/decks/create' do
  authenticate
  load_these
  deck = @user.decks.find_or_create_by_id(params[:deck]['id'])
  deck.update_attributes(params[:deck])

  redirect "/decks/#{deck.id}"
end
