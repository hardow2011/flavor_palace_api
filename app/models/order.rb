# == Schema Information
#
# Table name: orders
#
#  id                    :bigint           not null, primary key
#  addUtensilsAndNapkins :boolean
#  promoCode             :string
#  specialInstructions   :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  customer_id           :bigint           not null
#
# Indexes
#
#  index_orders_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#
class Order < ApplicationRecord
  belongs_to :customer
end
