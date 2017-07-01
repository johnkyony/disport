class AddKindsToBadges < ActiveRecord::Migration[5.1]
  def change
    add_reference :badges, :kind, foreign_key: true
  end
end
