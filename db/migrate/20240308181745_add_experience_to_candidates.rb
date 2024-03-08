class AddExperienceToCandidates < ActiveRecord::Migration[7.1]
  def change
    add_column :candidates, :experience, :string
  end
end
