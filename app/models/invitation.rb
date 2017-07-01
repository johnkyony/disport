# == Schema Information
#
# Table name: invitations
#
#  id                          :integer          not null, primary key
#  user_id                     :integer
#  game_id                     :integer
#  game_owner_response_status  :integer          default("pending")
#  game_player_response_status :integer          default("waiting")
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#

class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :game
  enum game_owner_response_status: { pending: 0, accepted: 1, declined: 2 }
  enum game_player_response_status: { waiting: 0, accept: 1, decline: 2 }

end
