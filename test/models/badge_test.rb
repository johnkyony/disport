# == Schema Information
#
# Table name: badges
#
#  id         :integer          not null, primary key
#  name       :string
#  points     :integer
#  default    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BadgeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
