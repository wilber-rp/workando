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
  has_one_attached :photo

  accepts_nested_attributes_for :candidate_interest_areas

  before_validation :check_cnpj_presence

private

  def check_cnpj_presence
    if self.cnpj.present?
      self.is_company = true
    else
      self.is_company = false
    end
  end
end
