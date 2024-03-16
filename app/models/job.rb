class Job < ApplicationRecord
  belongs_to :company
  belongs_to :interest_area
  has_many :matches, dependent: :destroy
  has_many :distances, dependent: :destroy
  has_many :candidates, through: :distances
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
