class AddTeamSizesToGames < ActiveRecord::Migration[5.1]
  def change
    add_reference :games, :team_size, foreign_key: true
  end
end
