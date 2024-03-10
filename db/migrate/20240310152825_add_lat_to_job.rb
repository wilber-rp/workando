class AddLatToJob < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :lat, :string
  end
end
