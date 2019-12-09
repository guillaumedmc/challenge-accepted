class AddThemeToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :theme, :string
  end
end
