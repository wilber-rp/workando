class Company < ApplicationRecord
  belongs_to :user
  has_many :jobs

  validates :cnpj, :company_name, presence: true
  validates :cnpj, uniqueness: true
end
