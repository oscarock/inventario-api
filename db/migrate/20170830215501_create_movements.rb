class CreateMovements < ActiveRecord::Migration[5.1]
  def change
    create_table :movements do |t|
      t.integer :movement_type
      t.text :amount
      t.belongs_to :articles, foreign_key: true

      t.timestamps
    end
  end
end
