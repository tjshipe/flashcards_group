
new_user = User.new(email: "test@test.com")
new_user.password = "123"
new_user.save!

10.times do
  Deck.create!(title: Faker::Name.name, user_id: 1)
end

100.times do
  Card.create!(front: Faker::Lorem.sentence, back: Faker::Lorem.word, deck_id: rand(1..10))  
end
