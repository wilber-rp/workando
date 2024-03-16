class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :match
  has_one :candidate, through: :match
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
end
