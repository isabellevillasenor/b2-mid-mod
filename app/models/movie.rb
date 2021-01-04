class Movie < ApplicationRecord
  has_many :movie_actors, dependent: :destroy
  has_many :actors, through: :movie_actors
  belongs_to :studio

  def act_age
    actors.order(:age)
  end

  def avg_act
    actors.average(:age).round(1)
  end
end