class AddReleasingStatusToMovies < ActiveRecord::Migration[7.2]
  def change
    add_column :movies, :releasing_status, :integer, default: 0
  end
end
