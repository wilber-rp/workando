class Candidate < ApplicationRecord
  belongs_to :user

  # candidate belogon to user because there is a user_Id in it.
  has_many :candidate_interest_areas, dependent: :destroy
  has_many :interest_areas, through: :candidate_interest_areas
  has_many :matches, dependent: :destroy
  has_many :distances
  has_many :jobs, through: :distances

  accepts_nested_attributes_for :candidate_interest_areas

  validates :first_name, :last_name, :cpf, :phone, presence: true

  has_one_attached :photo
end
