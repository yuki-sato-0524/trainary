class AddYearToGoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :year, :integer
  end
end
