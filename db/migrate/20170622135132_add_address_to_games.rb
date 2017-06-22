class AddAddressToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :address, :text
    add_column :games, :latitude, :float
    add_column :games, :longitude, :float
  end
end
