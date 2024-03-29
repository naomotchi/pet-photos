class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email
    validates :password
    validates :password_confirmation
  end

  has_many :photos
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :like_stories, through: :likes, source: :photo
end
