User.delete_all
Deck.delete_all
Card.delete_all

new_user = User.new(email: "test@test.com")
new_user.password = "123"
new_user.save!

awesome_deck = Deck.create(title: 1)
(1..5).to_a.each do |i|
	is = i.to_s
	awesome_deck.cards << Card.create(front: is, back: is)
end

cooler_new_user = User.new(email: 'a')
cooler_new_user.decks << awesome_deck
cooler_new_user.password = 'a'
cooler_new_user.save!

# 10.times do
#   Deck.create!(title: Faker::Name.name, user_id: 1)
# end

# 100.times do
#   Card.create!(front: Faker::Lorem.sentence, back: Faker::Lorem.word, deck_id: Deck.all.sample.id)  
# end

Deck.all.each do |deck|
	deck.shuffle!
end

