class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader, presence: true

  has_many :comments
  belongs_to :user
end