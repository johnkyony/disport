# == Schema Information
#
# Table name: kinds
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Kind < ApplicationRecord
has_many :badges  
has_many :points  
validates :name, :presence => true
validates :name, :uniqueness => true
end
