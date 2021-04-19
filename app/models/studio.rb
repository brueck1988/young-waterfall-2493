class Studio < ApplicationRecord
  has_many :movies

  def actors_for_show
    actors = []
    movies.each do |movie|
      movie.actors.currently_working.order_by_age.each do |actor|
        actors << actor.name
      end
    end
    actors = actors.uniq
  end
end
