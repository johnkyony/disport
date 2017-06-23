class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :game
  enum game_owner_response_status: { pending: 0, accepted: 1, declined: 2 }
  enum game_player_response_status: { waiting: 0, accept: 1, decline: 2 }

end
