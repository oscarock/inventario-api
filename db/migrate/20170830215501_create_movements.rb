class CreateMovements < ActiveRecord::Migration[5.1]
  def change
    create_table :movements do |t|
	  t.belongs_to :movement_type    	
      t.belongs_to :article, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
