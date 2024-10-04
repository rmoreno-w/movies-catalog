class Movie < ApplicationRecord
  belongs_to :movie_director
  belongs_to :genre
  enum :draft_status, { published: 0, draft: 1 }
  enum :releasing_status, { to_be_released: 0, released: 1 }
end
