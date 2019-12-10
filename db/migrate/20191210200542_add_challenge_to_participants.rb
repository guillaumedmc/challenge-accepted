class AddChallengeToParticipants < ActiveRecord::Migration[5.2]
  def change
    add_reference :participants, :challenge, foreign_key: true
  end
end
