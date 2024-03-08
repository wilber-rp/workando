class Candidate < ApplicationRecord
  belongs_to :user
  # candidate belogon to user because there is a user_Id in it.
  has_many :candidate_interest_areas
  has_many :interest_areas, through: :candidate_interest_areas
  has_many :matches

  validates :first_name, :last_name, :cpf, :phone, presence: true
end
