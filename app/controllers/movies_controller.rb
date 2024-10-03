require "date"

class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
  end

  def create
    title, year, synopsis, origin_country, movie_length, received_movie_director, received_genre = params[:movie]
      .values_at(:title, :year, :synopsis, :origin_country, :movie_length, :movie_director_id, :genre_id)

    genre = Genre.find(received_genre)
    movie_director = MovieDirector.find(received_movie_director)

    new_movie = Movie.new(
      title: title,
      year: year,
      synopsis: synopsis,
      origin_country: origin_country,
      genre: genre,
      movie_length: movie_length,
      movie_director: movie_director
    )

    if new_movie.save
      redirect_to movies_path
    else
      render :create
    end
  end

  def show
    received_id = params[:id]
    @movie = Movie.find(received_id)
  end

  def edit
    received_id = params[:id]
    @movie = Movie.find(received_id)
  end

  def update
    recieved_movie_id = params[:id]
    title, year, synopsis, origin_country, movie_length, received_movie_director, received_genre = params[:movie]
      .values_at(:title, :year, :synopsis, :origin_country, :movie_length, :movie_director_id, :genre_id)

    genre = Genre.find(received_genre)
    movie_director = MovieDirector.find(received_movie_director)
    @movie = Movie.find(recieved_movie_id)

    if @movie.update(
      title: title,
      year: year,
      synopsis: synopsis,
      origin_country: origin_country,
      genre: genre,
      movie_length: movie_length,
      movie_director: movie_director
    )
      redirect_to movie_path(@movie.id)
    else
      render :edit
    end
  end
end
