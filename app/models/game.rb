class Game < ApplicationRecord
  belongs_to :user
  belongs_to :place
  belongs_to :games_size
end
