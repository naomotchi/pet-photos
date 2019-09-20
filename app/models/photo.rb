class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader, presence: true

  with_options presence: true do
  validates :text  
  validates :name
  validates :image
  end
  
  has_many :comments
  belongs_to :user, optional: true
  has_many :comments,foreign_key: :photo_id, dependent: :destroy
end