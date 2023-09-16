# == Schema Information
#
# Table name: users
#
#  id                      :bigint           not null, primary key
#  email                   :string
#  firstName               :string
#  lastName                :string
#  login_token             :string
#  login_token_verified_at :datetime
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  # has_one :employee
  # has_one :customer
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
            uniqueness: { case_sensitive: false },
            presence: true
  before_save :downcase_email

  private

  def downcase_email
    self.email = email.downcase
  end
end
