class AddTeamSizeToGames < ActiveRecord::Migration[5.1]
  def change
    add_reference :games, :team_sizes, foreign_key: true
  end
end
