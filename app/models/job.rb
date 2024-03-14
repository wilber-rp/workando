class Job < ApplicationRecord
  belongs_to :company
  belongs_to :interest_area
  has_many :matches, dependent: :destroy
  has_many :distances, dependent: :destroy
  has_many :candidates, through: :distances
end
