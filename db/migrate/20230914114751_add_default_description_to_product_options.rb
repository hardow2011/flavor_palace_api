class AddDefaultDescriptionToProductOptions < ActiveRecord::Migration[7.0]
  def change
    add_column :product_options, :default_description, :boolean
  end
end
