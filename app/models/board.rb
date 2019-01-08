class Board < ApplicationRecord
  validates :title, presence: true, length: {maximum: 50}
  validates :content, presence: true, length: {maximum: 1000 }
  
  belongs_to :user
  
  has_many :favorites, dependent: :destroy
  has_many :likeds ,through: :favorites, source: :user
  
  has_one_attached :image
end
