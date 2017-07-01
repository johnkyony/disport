# == Schema Information
#
# Table name: levels
#
#  id         :integer          not null, primary key
#  badge_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Level < ApplicationRecord
belongs_to :badge  
belongs_to :user  
end
