class User < ActiveRecord::Base
  include BCrypt
  has_many :decks 

  validates :email, :presence => :true, :uniqueness => :true
  validates :password_hash, :presence => :true
  
  before_destroy :clear_session

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def cards
    Card.joins('JOIN decks ON cards.deck_id = decks.id').joins('JOIN users ON decks.user_id = users.id').where('users.id = ?', id)
  end
end
