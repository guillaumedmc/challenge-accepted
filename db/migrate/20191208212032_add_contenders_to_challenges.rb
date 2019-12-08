class AddContendersToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :contenders, :text
  end
end
