class AddGifToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :gif, :string
  end
end
