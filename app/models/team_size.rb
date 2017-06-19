# == Schema Information
#
# Table name: team_sizes
#
#  id         :integer          not null, primary key
#  size       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_id    :integer
#

class TeamSize < ApplicationRecord
    belongs_to :game
end
