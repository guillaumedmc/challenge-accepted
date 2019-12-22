class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  validates :role, presence: true
  validates :user, presence: true, uniqueness: { scope: [:challenge, :role] }
end
