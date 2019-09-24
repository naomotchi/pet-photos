class Photo < ApplicationRecord

  # mount_uploader :image, ImageUploader, presence: true
  has_one_attached :image
  with_options presence: true do
  validates :text  
  validates :name
  validates :image
  end

  # belongs_to :album
  belongs_to :user, optional: true
  has_many :comments,foreign_key: :photo_id, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
end