get '/cards/:card_id' do
  authenticate
  p params
  load_these(params[:deck_id], params[:card_id])
  # if @card
  #   @deck_id = @card.deck.id
  # else 
  #   @card = Card.new
  #   @deck_id = @deck.id
  # end
  erb :edit_card
end

post '/cards/delete' do
  authenticate
  load_these(params[:deck_id], params[:card_id])
  deck_id = @card.deck.id
  @card.destroy

  redirect "/decks/#{deck_id}"
end

post '/cards/create' do
  authenticate
  load_these(params[:card][:deck_id])
  card = @deck.cards.find_or_create_by_id(params[:card]['id'])
  card.update_attributes(params[:card])

  redirect "/decks/#{@deck.id}"
end
