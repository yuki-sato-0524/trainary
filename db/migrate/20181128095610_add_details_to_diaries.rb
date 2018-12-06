class AddDetailsToDiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :diaries, :month, :integer
    add_column :diaries, :date, :integer
  end
end
