# == Schema Information
#
# Table name: games
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  address      :text
#  latitude     :float
#  longitude    :float
#  team_size_id :integer
#

class Game < ApplicationRecord
  belongs_to :user
  has_many :team_sizes
  attr_accessor :raw_address
  has_many :invitations
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  geocoded_by :raw_address
  after_validation -> {
    self.address = self.raw_address
    geocode
  }, if: ->(obj){ obj.raw_address.present? and obj.raw_address != obj.address }
  
  after_validation :reverse_geocode, unless: ->(obj) { obj.raw_address.present? },
                   if: ->(obj){ obj.latitude.present? and obj.latitude_changed? and obj.longitude.present? and obj.longitude_changed? }
    after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
    after_validation :reverse_geocode, unless: ->(obj) { obj.address.present? },
                     if: ->(obj){ obj.latitude.present? and obj.latitude_changed? and obj.longitude.present? and obj.longitude_changed? }
                       
  
end
