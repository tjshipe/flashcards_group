class Card < ActiveRecord::Base
  belongs_to :deck

  validates :front, :presence => :true
  validates :back, :presence => :true

  def guess_correct?(guess)
    if guess == self.back
      return true
    else
      return false
    end
  end
end
