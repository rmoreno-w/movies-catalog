class CreateMovies < ActiveRecord::Migration[7.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.text :synopsis
      t.string :origin_country
      t.integer :movie_length
      t.references :movie_director, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
