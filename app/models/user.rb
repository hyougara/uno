class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  mount_uploader :user_image, UserImageUploader

  has_many :posts , dependent: :destroy
  has_many :favorites
  has_many :favorite_posts, through: :favorites, source: :post
end
