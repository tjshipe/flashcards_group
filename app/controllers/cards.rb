get '/cards/play' do
  # @card = Card.all.sample
  @card = {id: 3, front: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque, ratione, iusto, ab, molestias quis blanditiis quaerat hic omnis praesentium asperiores nostrum doloribus deserunt eum esse dolor voluptatibus illum? Laboriosam, consequuntur.", back: 'back'}
  erb :show_card
end

post '/cards/play' do
p params
  @card = Card.find(params[:card]['id']
  if guess_correct?
    puts "It WORKS! #{guess_correct?}"
    redirect '/cards/play'
  else
    puts "It fucked up"
    erb :show_card
  end
end
