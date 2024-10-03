class Movie < ApplicationRecord
  belongs_to :movie_director
  belongs_to :genre
end
