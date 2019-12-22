class Comment < ApplicationRecord
  belongs_to :challenge
  belongs_to :user
  validates :content, presence: true
end
