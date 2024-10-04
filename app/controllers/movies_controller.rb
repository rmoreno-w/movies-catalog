require "date"

class MoviesController < ApplicationController
  def index
    @released_movies = Movie.published.released
    @to_be_released_movies = Movie.published.to_be_released
  end

  def new
    @type = "new"
  end

  def create
    title, year, synopsis, origin_country, movie_length, received_movie_director, received_genre, draft_status, releasing_status =
    params[:movie].values_at(:title, :year, :synopsis, :origin_country, :movie_length, :movie_director_id, :genre_id, :draft_status, :releasing_status)

    genre = Genre.find(received_genre)
    movie_director = MovieDirector.find(received_movie_director)
    draft_status = draft_status ==  "0" ? :published : :draft

    new_movie = Movie.new(
      title: title,
      year: year,
      synopsis: synopsis,
      origin_country: origin_country,
      genre: genre,
      movie_length: movie_length,
      movie_director: movie_director,
      draft_status: draft_status,
      releasing_status: releasing_status
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
    @type = "edit"
    received_id = params[:id]
    @movie = Movie.find(received_id)
  end

  def update
    recieved_movie_id = params[:id]
    title, year, synopsis, origin_country, movie_length, received_movie_director, received_genre, draft_status, releasing_status =
    params[:movie].values_at(:title, :year, :synopsis, :origin_country, :movie_length, :movie_director_id, :genre_id, :draft_status, :releasing_status)

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
      movie_director: movie_director,
      draft_status: draft_status,
      releasing_status: releasing_status
    )
      redirect_to movie_path(@movie.id)
    else
      render :edit
    end
  end
end
