# == Schema Information
#
# Table name: product_options
#
#  id                  :bigint           not null, primary key
#  default_description :boolean
#  description         :string
#  hidden              :boolean
#  name                :string
#  price               :float
#  quantity            :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  product_id          :bigint           not null
#
# Indexes
#
#  index_product_options_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
require "test_helper"

class ProductOptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
