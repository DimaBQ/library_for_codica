class CreateCategorizings < ActiveRecord::Migration[5.2]
  def change
    create_table :categorizings do |t|
      t.belongs_to :book, foreign_key: true
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
