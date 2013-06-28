post '/cards/delete' do
  card = Card.find(params[:card_id])
  deck_id = card.deck.id
  card.destroy

  redirect "/decks/#{deck_id}"
end

post '/cards/create' do
  p params
  card = Card.find_or_create_by_id(params[:card]['id'])
  card.update_attributes(params[:card])

  redirect "/decks/#{params[:card]['deck_id']}"
end

get '/cards/:card_id' do
  @card = Card.find(params[:card_id])
  erb :edit_card
end
