class Register < ApplicationRecord
  has_many :photos
  has_many :photos, through: :albums
  has_many :albums
end
