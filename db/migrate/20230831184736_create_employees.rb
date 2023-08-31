class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.boolean :isAdmin
      t.references :User, null: false, foreign_key: true

      t.timestamps
    end
  end
end
