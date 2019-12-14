class Challenge < ApplicationRecord
  belongs_to :user
  has_many :participants, dependent: :destroy
  has_many :comments, dependent: :destroy
end
