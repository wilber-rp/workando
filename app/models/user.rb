class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :jobs, dependent: :destroy
  has_many :candidate_interest_areas, dependent: :destroy
  has_many :interest_areas, through: :candidate_interest_areas
  has_many :matches, dependent: :destroy
  has_many :distances, dependent: :destroy
  has_many :chatrooms, through: :matches
  has_many :jobs, dependent: :destroy

  accepts_nested_attributes_for :candidate_interest_areas

  has_one_attached :photo

  # has_one :candidate, dependent: :destroy
  # has_one :company, dependent: :destroy
  # enum role: [:role_candidate, :role_company]
  # validates :role, presence: true
end
