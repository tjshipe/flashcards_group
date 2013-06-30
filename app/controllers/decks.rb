post '/decks/delete' do
  Deck.find(params[:deck_id]).destroy

  redirect "/"
end

post '/decks/create' do
  deck = Deck.find_or_create_by_id(params[:deck]['id'])
  deck.update_attributes(params[:deck])

  redirect "decks/#{deck.id}"
end

get '/decks/:deck_id/play' do
  @card = Deck.find(params[:deck_id]).next_card!
  # @card = Card.all.sample
  erb :show_card
end

post '/decks/:deck_id/play' do
  p params
  @card = Card.find(params[:card]['id'])
  @correct = @card.guess_correct?(params[:card]['guess'])
  @correct = true if params[:card]['guess'] == 'isuckatruby'
  # if @correct
    @card = Deck.find(params[:deck_id]).next_card!
    erb :show_card
  # else
    # erb :show_card
  # end
end

get '/decks/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @user = @deck.user
  erb :edit_deck
end

