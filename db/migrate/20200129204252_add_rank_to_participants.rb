class AddRankToParticipants < ActiveRecord::Migration[5.2]
  def change
    add_column :participants, :rank, :integer
  end
end
