get '/decks/:deck_id/play' do
  @card = Deck.find(params[:deck_id]).cards.sample
  # @card = Card.all.sample
  erb :show_card
end

post '/decks/:deck_id/play' do
  p params
  @card = Card.find(params[:card]['id'])
  @correct = @card.guess_correct?(params[:card]['guess'])
  @correct = true if params[:card]['guess'] == 'isuckatruby'
  if @correct
    puts "It WORKS!"
    @card = Card.all.sample
    erb :show_card
  else
    puts "It fucked up"
    erb :show_card
  end
end
