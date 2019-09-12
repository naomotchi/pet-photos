class Photo < ApplicationRecord

  mount_uploader :image, ImageUploader, presence: true

  belongs_to :user
end