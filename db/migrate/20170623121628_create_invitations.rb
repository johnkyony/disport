class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true
      t.integer :game_owner_response_status , default: 0
      t.integer :game_player_response_status , default: 0

      t.timestamps
    end
  end
end
