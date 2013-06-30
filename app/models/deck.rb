class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :cards

  validates :title, :presence => :true

  after_initialize :init

  def init
    @skipped = 0
  end

  def skipped
    @skipped
  end

  def next_card!
    return_card = next_card
    return_card.order_num = cards.maximum(:order_num) + 1
    return_card.save

    shuffle! if cards.maximum(:session_correct) == cards.minimum(:session_correct)

    #if return_card.session_correct > cards.minimum(:session_correct) || 
    if return_card.skip_by_lifetime_correct?
      @skipped += 1
      if @skipped > 10
        p '!!! @skipped > 10 !!!'
        return return_card 
      end
      return next_card!
    else
      @skipped = 0
      return return_card
    end
  end

  def next_card
    card_with_min_order_num
  end

  def shuffle!
    p "shuffling deck.title #{title}"
    cards.shuffle.each_with_index do |card, i|
      card.session_correct = 0
      card.session_incorrect = 0
      card.order_num = i
      card.save
    end
  end

  def mean_lifetime_correct_incorrect_ratio
    cards.inject(0){|acc, c| acc + c.lifetime_correct_incorrect_ratio} / cards.length.to_f
  end

  def variance_lifetime_correct_incorrect_ratio
    m = mean_lifetime_correct_incorrect_ratio
    sum = cards.inject(0){|acc, c| acc +(c.lifetime_correct_incorrect_ratio-m)**2 }
    sum/(cards.length - 1).to_f
  end

  def standard_deviation_lifetime_correct_incorrect_ratio
    Math.sqrt(variance_lifetime_correct_incorrect_ratio)
  end

  private

  def card_with_min_order_num
    cards.find_by_order_num(cards.minimum(:order_num))
  end

end
