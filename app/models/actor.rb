class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def self.currently_working
    where(currently_working: true)
  end

  def self.order_by_age
    order(age: :desc)
  end
end
