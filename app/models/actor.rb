class Actor < ApplicationRecord
  has_many :movie_actors, dependent: :destroy
  has_many :movies, through: :movie_actors

  #def coworker
   # coworker = Actor.joins(:movie_actors)
   #                 .where(movie_actors: :movie_id)
  #end
end