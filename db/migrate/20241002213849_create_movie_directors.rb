class CreateMovieDirectors < ActiveRecord::Migration[7.2]
  def change
    create_table :movie_directors do |t|
      t.string :name
      t.string :nationality
      t.datetime :birth_date
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
