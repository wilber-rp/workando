class AddLongToCandidate < ActiveRecord::Migration[7.1]
  def change
    add_column :candidates, :long, :string
  end
end
