class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :image_url
      t.integer :code
      t.text :description
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
