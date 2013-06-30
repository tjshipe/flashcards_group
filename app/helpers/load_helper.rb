def load_these(deck_id=nil, card_id=nil)
  @user = User.find(session[:user_id])
  @deck = @user.decks.find(deck_id) if deck_id

  if card_id && @deck
    @card = @deck.cards.find(card_id)
  elsif card_id
    @card = @user.cards.find(card_id)
    @deck = @card.deck
  end
end