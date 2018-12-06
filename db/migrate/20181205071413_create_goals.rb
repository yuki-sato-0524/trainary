class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.float :goal_wieght
      t.float :goal_protein
      t.text :goal_memo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
