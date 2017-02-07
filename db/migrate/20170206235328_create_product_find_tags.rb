class CreateProductFindTags < ActiveRecord::Migration[5.0]
  def change
    create_table :product_find_tags do |t|
      t.references :tag, foreign_key: true
      t.references :product_find, foreign_key: true

      t.timestamps
    end
  end
end
