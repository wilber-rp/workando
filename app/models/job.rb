class Job < ApplicationRecord
  belongs_to :company
  belongs_to :interest_area
  has_many :matches

end

