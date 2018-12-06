class RemoveGoalwieghtFromGoals < ActiveRecord::Migration[5.2]
  def change
    remove_column :goals, :goal_wieght, :integer
  end
end
