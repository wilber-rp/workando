class AddDistanceToMatch < ActiveRecord::Migration[7.1]
  def change
    add_column :matches, :distance, :float
  end
end
