# == Schema Information
#
# Table name: images
#
#  id                :bigint           not null, primary key
#  order             :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  product_option_id :bigint           not null
#
# Indexes
#
#  index_images_on_product_option_id  (product_option_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_option_id => product_options.id)
#
require "test_helper"

class ImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
