class CreateDeliveryInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_infos do |t|
      t.boolean :toShip
      t.string :shippingAddress
      t.boolean :asap
      t.date :scheduled
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
