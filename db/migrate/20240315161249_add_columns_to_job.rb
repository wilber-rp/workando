class AddColumnsToJob < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :longitude, :float
    add_column :jobs, :latitude, :float
  end
end
