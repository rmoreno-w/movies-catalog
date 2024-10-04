class AddDraftStatusToMovies < ActiveRecord::Migration[7.2]
  def change
    add_column :movies, :draft_status, :integer, default: 1
  end
end
