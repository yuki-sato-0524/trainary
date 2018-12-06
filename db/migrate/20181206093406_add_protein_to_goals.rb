class AddProteinToGoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :goal_weight, :float
  end
end
