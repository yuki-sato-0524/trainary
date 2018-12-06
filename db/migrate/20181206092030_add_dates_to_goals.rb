class AddDatesToGoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :month, :integer
    add_column :goals, :date, :integer
  end
end
