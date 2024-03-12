class InterestArea < ApplicationRecord
  has_many :jobs
  has_many :candidate_interest_areas
  has_many :candidates, through: :candidate_interest_areas
end
