get '/cards/play' do
  @card = Card.all.sample
  erb :show_card
end

post '/cards/play' do
p params
  @card = Card.find(params[:card]['id'])
  if @card.guess_correct?(params[:card]['guess'])
    puts "It WORKS!"
    redirect '/cards/play'
  else
    puts "It fucked up"
    erb :show_card
  end
end
