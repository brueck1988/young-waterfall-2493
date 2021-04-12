class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    # if params[:search].present?
    #   @actor = Actor.search(params[:search])
    # end
  end

  def update
    @movie = Movie.find(params[:id])
    if params[:search].present?
      @actor = Actor.search(params[:search])
      MovieActor.create!(movie_id: @movie.id, actor_id: @actor[0].id)
    end
    render :show
  end
end
