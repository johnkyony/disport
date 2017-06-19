class CreateGamesSizes < ActiveRecord::Migration[5.1]
  def change
    create_table :games_sizes do |t|
      t.integer :sizes

      t.timestamps
    end
  end
end
