# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Product < ApplicationRecord
  after_create :create_options

  attr_accessor :quantity, :price, :description, :hidden

  def create_options
    product_option = ProductOption.create(name: 'Standard', hidden: self.hidden, description: self.description, price: self.price, quantity: self.quantity)
    product_option.product = self

    unless product_option.save
      errors.add(:base, 'There was an error creating the option')
      ActiveRecord::Rollback
    end
  end
end
