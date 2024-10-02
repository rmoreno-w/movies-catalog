class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def new
  end

  def create
    received_name = params[:genre][:name]

    new_genre = Genre.new(name: received_name)

    if new_genre.save
      flash[:now] = "Novo gênero cadastrado com sucesso!"

      redirect_to genres_path
    else
      render :create
    end
  end

  def show
    received_id = params[:id]
    @genre = Genre.find(received_id)
  end

  def edit
    received_id = params[:id]
    @genre = Genre.find(received_id)
  end

  def update
    received_id = params[:id]
    @genre = Genre.find(received_id)

    received_name = params[:genre][:name]

    if @genre.update(name: received_name)
      redirect_to genre_path(@genre.id)
    else
      render :edit
    end
  end
end
