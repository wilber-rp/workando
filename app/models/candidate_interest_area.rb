class CandidateInterestArea < ApplicationRecord
  belongs_to :candidate
  belongs_to :interestarea
  belongs_to :job, through: :interest_area
end
