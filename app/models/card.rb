class Card < ActiveRecord::Base
  belongs_to :deck

  validates :front, :presence => :true
  validates :back, :presence => :true

  after_initialize :init

  def guess_correct?(guess)
    if guess == back
      self.session_correct += 1
      self.lifetime_correct += 1
      save
      return true
    else
      self.session_incorrect += 1
      self.lifetime_incorrect += 1
      save
      return false
    end
  end

  def skip_by_lifetime_correct?
    lucky_num = std_devs_from_mean * 50
    if rand(101) < lucky_num
      return true
    else
      return false
    end
  end

  def std_devs_from_mean
    (lifetime_correct_incorrect_ratio - deck.mean_lifetime_correct_incorrect_ratio) / deck.standard_deviation_lifetime_correct_incorrect_ratio
  end

  def lifetime_correct_incorrect_ratio
    li = lifetime_incorrect
    li = 1 if li == 0

    lifetime_correct / li.to_f
  end

  private

  def init
    assign_order

    self.session_correct ||= 0
    self.lifetime_correct ||= 0
    self.session_incorrect ||= 0
    self.lifetime_incorrect ||= 0
  end

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
