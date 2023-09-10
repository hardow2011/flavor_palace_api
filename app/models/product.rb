# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  name       :string
#  permalink  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Product < ApplicationRecord
  after_create :create_options
  before_save :generate_permalink

  attr_accessor :quantity, :price, :description, :hidden

  has_many :product_options, dependent: :delete_all

  private

  def create_options
    product_option = ProductOption.create(name: 'Standard', hidden: self.hidden, description: self.description, price: self.price, quantity: self.quantity)
    product_option.product = self

    unless product_option.save
      errors.add(:base, 'There was an error creating the option')
      ActiveRecord::Rollback
    end
  end

  def generate_permalink
    self.permalink = self.name.parameterize
  end
end
