class Photo < ApplicationRecord
  has_many_attached :images
  validate :image_type
  
  def thumbnail input
    return self.images[input].variant(resize: '200x200!').processed
  end
  
  private
  
    def image_type
      if images.each do |image|
        if !image.content_type.in?(%('image/jpec image/png'))
          errors.add(:images, 'needs to be a JPEG or PNG')
        end
      end
    end
  end
end