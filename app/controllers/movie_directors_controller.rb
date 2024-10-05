require "date"

class MovieDirectorsController < ApplicationController
  def index
    @movie_directors = MovieDirector.all
  end

  def new
  end

  def create
    name, nationality, birth_date, received_genre = params[:movie_director].values_at(:name, :nationality, :birth_date, :genre_id)
    genre = Genre.find(received_genre)

    new_director = MovieDirector.new(name: name, nationality: nationality, birth_date: birth_date, genre: genre)

    if new_director.save
      # flash[:now] = "Novo gênero cadastrado com sucesso!"

      redirect_to movie_directors_path
    else
      render :create
    end
  end

  def show
    received_id = params[:id]
    @movie_director = MovieDirector.find(received_id)
  end

  def edit
    received_id = params[:id]
    @movie_director = MovieDirector.find(received_id)
  end

  def update
    director_id = params[:id]
    @movie_director = MovieDirector.find(director_id)

    name, nationality, birth_date, received_genre = params[:movie_director].values_at(:name, :nationality, :birth_date, :genre_id)
    genre = Genre.find(received_genre)

    if @movie_director.update(name: name, nationality: nationality, birth_date: birth_date, genre: genre)
      redirect_to movie_director_path(@movie_director.id)
    else
      render :edit
    end
  end
end
