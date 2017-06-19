class RemoveTeamSizeToGames < ActiveRecord::Migration[5.1]
  def change
    remove_reference :games, :team_sizes, foreign_key: true
  end
end
