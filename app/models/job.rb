class Job < ApplicationRecord
  belongs_to :interest_area
  belongs_to :user
  has_many :matches, dependent: :destroy
  has_many :distances, dependent: :destroy
  has_many :candidates, through: :distances
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # belongs_to :company
end
