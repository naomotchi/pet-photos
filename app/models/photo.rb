class Photo < ApplicationRecord
  has_many_attached :images
  belongs_to :user

  def thumbnail input
    return self.images[input].variant(resize: '200x200!').processed
  end
end