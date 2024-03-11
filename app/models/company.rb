class Company < ApplicationRecord
  belongs_to :user
  has_many :jobs, dependent: :destroy

  validates :cnpj, :company_name, presence: true
  validates :cnpj, uniqueness: true
end
