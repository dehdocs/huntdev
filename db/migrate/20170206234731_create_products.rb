class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.references :user, foreign_key: true
      t.string :image
      t.string :title
      t.references :category, foreign_key: true
      t.references :price_range, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
