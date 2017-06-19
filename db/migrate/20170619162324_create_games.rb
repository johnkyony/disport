class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.references :user, foreign_key: true
      t.references :place, foreign_key: true
      t.references :games_size, foreign_key: true

      t.timestamps
    end
  end
end
