# == Schema Information
#
# Table name: delivery_infos
#
#  id              :bigint           not null, primary key
#  asap            :boolean
#  scheduled       :date
#  shippingAddress :string
#  toShip          :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  order_id        :bigint           not null
#
# Indexes
#
#  index_delivery_infos_on_order_id  (order_id)
#
# Foreign Keys
#
#  fk_rails_...  (order_id => orders.id)
#
require "test_helper"

class DeliveryInfoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
