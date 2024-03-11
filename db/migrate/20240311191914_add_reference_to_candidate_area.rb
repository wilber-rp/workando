class AddReferenceToCandidateArea < ActiveRecord::Migration[7.1]
  def change
    remove_reference :candidate_interest_areas, :interest_areas
    add_reference :candidate_interest_areas, :interest_area, foreign_key: true
  end
end
