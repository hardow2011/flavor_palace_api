# == Schema Information
#
# Table name: users
#
#  id          :bigint           not null, primary key
#  email       :string
#  firstName   :string
#  lastName    :string
#  password    :string
#  phoneNumber :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
