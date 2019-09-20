class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader, presence: true

  with_options presence: true do
  validates :text  
  validates :name
  validates :image
  end

  belongs_to :register
  belongs_to :user, optional: true
  belongs_to :album
  has_many :comments,foreign_key: :photo_id, dependent: :destroy
end