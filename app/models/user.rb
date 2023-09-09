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
class User < ApplicationRecord
  # has_one :employee
  # has_one :customer
end
