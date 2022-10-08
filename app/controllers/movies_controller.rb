class MoviesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    movies = Movie.all
    render json: movies
  end

  def summary
    movie = Movie.find(params[:id])
    render json: movie, serializer: MoviesummarySerializer
  end

  def director
    movie = Movie.find(params[:id])
    render json: movie, serializer: MoviedirectorSerializer
  end

  def summaries
    movies = Movie.all
    render json: movies, each_serializer: MoviesummarySerializer
  end

  def directors 
    movies = Movie.all 
    render json: movies, each_serializer: MoviedirectorSerializer
  end

  def show
    movie = Movie.find(params[:id])
    render json: movie
  end

  private

  def render_not_found_response
    render json: { error: "Movie not found" }, status: :not_found
  end
end
