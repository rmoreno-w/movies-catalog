# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Genre.create([
  { name: "Comédia" },
  { name: "Ação" },
  { name: "Policial" } ])


MovieDirector.create!([
  { name: "Astrogildo Ramos Fonseca", nationality: "Brasileiro", birth_date: "1990-05-02", genre_id: Genre.first.id },
  { name: "Broncos Silva Oliveira", nationality: "Brasileiro", birth_date: "1960-07-05", genre_id: Genre.last.id } ])

# puts "Created Directors"
Movie.create!([
  {
    title: "Poeira em Alto Mar",
    year: 1990, synopsis: "Um filme realmente inesperado",
    origin_country: "Sérvia",
    movie_length: 150,
    movie_director_id: MovieDirector.first.id,
    genre_id: Genre.last.id,
    draft_status: 0,
    releasing_status: 1
  },
  {
    title: "A volta dos que não foram",
    year: 1990, synopsis: "Um filme chocante",
    origin_country: "Prússia",
    movie_length: 200,
    movie_director_id: MovieDirector.first.id,
    genre_id: Genre.last.id,
    draft_status: 0
  },
  {
    title: "A volta dos que ainda não foram mas estão para ir",
    year: 1990, synopsis: "Um filme chocante e inesperado",
    origin_country: "Prússia",
    movie_length: 200,
    movie_director_id: MovieDirector.last.id,
    genre_id: Genre.first.id,
    draft_status: 1 } ])
