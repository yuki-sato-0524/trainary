class User < ApplicationRecord
  before_save{ self.email.downcase! }
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 255},
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: {case_sensitive: false }
  has_secure_password
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/ }
  
  has_many :diaries
  has_many :goals
  has_many :boards
  
  has_many :favorites, dependent: :destroy
  has_many :likes ,through: :favorites, source: :board
  
  def like(board)
    self.favorites.find_or_create_by(board_id: board.id)
  end
  
  def unlike(board)
    relationship = self.favorites.find_by(board_id: board.id)
    relationship.destroy if relationship
  end
  
  
  def liked_it?(board)
    
    
    if self.favorites.find_by(board_id: board.id)
      return true
    else
      return false
    end
    
  end
  
end
