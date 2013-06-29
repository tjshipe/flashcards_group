class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :cards

  validates :title, :presence => :true

  def next_card!
    next_card = card_with_min_order_num
    next_card.order_num = cards.maximum(:order_num) + 1
    next_card.save

    next_card
  end

  def next_card
    card_with_min_order_num
  end

  def shuffle!
    cards.shuffle.each_with_index do |card, i|
      card.order_num = i
      card.save
    end
  end

  private

  def card_with_min_order_num
    cards.find_by_order_num(cards.minimum(:order_num))
  end

end
