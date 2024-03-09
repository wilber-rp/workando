class AddCityToCandidate < ActiveRecord::Migration[7.1]
  def change
    add_column :candidates, :city, :string
  end
end
