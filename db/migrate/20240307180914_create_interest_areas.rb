class CreateInterestAreas < ActiveRecord::Migration[7.1]
  def change
    create_table :interest_areas do |t|
      t.string :name

      t.timestamps
    end
  end
end
