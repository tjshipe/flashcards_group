class Card < ActiveRecord::Base
  belongs_to :deck

  validates :front, :presence => :true
  validates :back, :presence => :true

  after_initialize :assign_order

  def guess_correct?(guess)
    if guess == self.back
      return true
    else
      return false
    end
  end

  private

  def assign_order
    p 'assign_order'
    deck_cards = deck.cards if deck

    max = deck_cards.maximum(:order_num) if deck_cards

    p max
    if max
      order_num = deck.cards.maximum(:order_num) + 1
    else
      self.order_num = 0
    end
  end
end
