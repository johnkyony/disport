class CreateTeamSizes < ActiveRecord::Migration[5.1]
  def change
    create_table :team_sizes do |t|
      t.integer :size

      t.timestamps
    end
  end
end
