class CreateProductFinds < ActiveRecord::Migration[5.0]
  def change
    create_table :product_finds do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.string :url
      t.decimal :price
      t.string :title
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
