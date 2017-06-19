class RemoveGamesSizesFromGames < ActiveRecord::Migration[5.1]
  def change
    remove_reference :games, :games_size, foreign_key: true
  end
end
