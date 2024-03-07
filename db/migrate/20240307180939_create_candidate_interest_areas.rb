class CreateCandidateInterestAreas < ActiveRecord::Migration[7.1]
  def change
    create_table :candidate_interest_areas do |t|
      t.references :candidate, null: false, foreign_key: true
      t.references :interestarea, null: false, foreign_key: true

      t.timestamps
    end
  end
end
