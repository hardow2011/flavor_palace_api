class CreateProductOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :product_options do |t|
      t.string :name
      t.integer :quantity
      t.float :price
      t.string :description
      t.boolean :hidden
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
