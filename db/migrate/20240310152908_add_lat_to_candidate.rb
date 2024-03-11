class AddLatToCandidate < ActiveRecord::Migration[7.1]
  def change
    add_column :candidates, :lat, :string
  end
end
