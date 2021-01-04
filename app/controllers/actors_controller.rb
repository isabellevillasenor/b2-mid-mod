class ActorsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @actor = Actor.create(actor_params)
    MovieActor.create(movie_id: @movie.id, actor_id: @actor.id)
    redirect_back(fallback_location: movie_path(:movie_id))
  end

  private
  def actor_params
    params.permit(:name, :age)
  end
end