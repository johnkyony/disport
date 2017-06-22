class RemovePlacesFromGames < ActiveRecord::Migration[5.1]
  def change
    remove_reference :games, :place, foreign_key: true
  end
end
