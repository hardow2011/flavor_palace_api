class AddIndexToProductsPermalink < ActiveRecord::Migration[7.0]
  def change
    add_index :products, :permalink, unique: true
  end
end
