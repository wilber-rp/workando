class CreateCandidateInterestAreas < ActiveRecord::Migration[7.1]
  def change
    create_table :candidate_interest_areas do |t|
      t.references :user, null: false, foreign_key: true
      t.references :interest_area, null: false, foreign_key: true

      t.timestamps
    end
  end
end
