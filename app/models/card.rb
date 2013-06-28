class Card < ActiveRecord::Base

  def guess_correct?(guess)
    if guess == self.back
      return true
    else
      return false
    end
  end
end
