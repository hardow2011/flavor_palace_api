class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :specialInstructions
      t.string :promoCode
      t.boolean :addUtensilsAndNapkins
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
