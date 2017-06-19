# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  place_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Game < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_many :team_sizes
end
