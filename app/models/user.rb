class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :candidate, dependent: :destroy
  has_one :company, dependent: :destroy

  enum role: [:role_candidate, :role_company]
  validates :role, presence: true
end
