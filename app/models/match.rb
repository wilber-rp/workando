class Match < ApplicationRecord
  belongs_to :candidate
  belongs_to :job
  has_one :chatroom, dependent: :destroy
end
