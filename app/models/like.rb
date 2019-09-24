class Like < ApplicationRecord
  belongs_to :photo, counter_cache: :likes_count
  belongs_to :user
end
