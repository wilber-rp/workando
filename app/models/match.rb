class Match < ApplicationRecord
  belongs_to :user
  belongs_to :job
  has_one :chatroom, dependent: :destroy
end
