User.delete_all

new_user = User.new(email: "test@test.com")
new_user.password = "123"
new_user.save!

cooler_new_user = User.new(email: 'a')
cooler_new_user.password = 'a'
cooler_new_user.save!

Deck.delete_all
10.times do
  Deck.create!(title: Faker::Name.name, user_id: 1)
end

Card.delete_all
100.times do
  Card.create!(front: Faker::Lorem.sentence, back: Faker::Lorem.word, deck_id: Deck.all.sample.id)  
end

Deck.all.each do |deck|
	deck.shuffle!
end