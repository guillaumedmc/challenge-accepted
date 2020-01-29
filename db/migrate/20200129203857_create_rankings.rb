class CreateRankings < ActiveRecord::Migration[5.2]
  def change
    create_table :rankings do |t|
      t.references :user, foreign_key: true
      t.float :score

      t.timestamps
    end
  end
end
