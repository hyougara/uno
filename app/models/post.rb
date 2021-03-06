class Post < ApplicationRecord
  validates :title, presence: true, length: {maximum:100}
  validates :content , presence: true ,length: {maximum:140}

  belongs_to :user
  has_many :favorites

  def favorited_by?(user)
    favorites.where(user_id: user.id).present?
  end
end
