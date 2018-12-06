class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.text :content
      t.float :weight
      t.float :protein
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
