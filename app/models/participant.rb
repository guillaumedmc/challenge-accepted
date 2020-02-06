class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  validates :role, presence: true
  validates :user, presence: true, uniqueness: { scope: [:challenge, :role] }
  after_update :update_score
  # after_create :set_score

  # def set_score
  #   if self.user.score.nil?
  #     self.user.score = 0
  #     user.save
  #   else
  #   end
  # end

  def update_score
    if self.rank.nil?
    else
      if self.user.score.nil?
        self.user.score = 0
        self.user.score = (6 - self.rank)*2
        user.save!
      else
        self.user.score = self.user.score + (6 - self.rank)*2
        user.save!
      end
    end
  end

end
