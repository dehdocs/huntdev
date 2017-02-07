class CreatePriceRanges < ActiveRecord::Migration[5.0]
  def change
    create_table :price_ranges do |t|
      t.string :name

      t.timestamps
    end
  end
end
