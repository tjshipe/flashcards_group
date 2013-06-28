10.times do
  Deck.create(title: Faker::Name.name)
end

100.times do
  Card.create(front: Faker::Lorem.word, back: Faker::Lorem.sentence, deck_id: rand(1..10))  
end
