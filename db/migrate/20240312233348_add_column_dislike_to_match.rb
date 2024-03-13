class AddColumnDislikeToMatch < ActiveRecord::Migration[7.1]
  def change
    add_column :matches, :dislike, :boolean
  end
end
