class Company < ApplicationRecord
  belongs_to :user
  has_many :jobs
  hast many :interest_areas, through: :jobs
end
