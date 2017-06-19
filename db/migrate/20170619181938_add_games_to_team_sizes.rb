class AddGamesToTeamSizes < ActiveRecord::Migration[5.1]
  def change
    add_reference :team_sizes, :game, foreign_key: true
  end
end
