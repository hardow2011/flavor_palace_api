# == Schema Information
#
# Table name: users
#
#  id                      :bigint           not null, primary key
#  email                   :string
#  first_name              :string
#  last_name               :string
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

  def send_magic_link(request_origin)
    generate_login_token
    UserMailer.magic_link(self, login_link(request_origin)).deliver_now
  end

  # generate login token to authorize user
  def generate_login_token
    # create a login_token and set i to expire in 60 minutes
    payload = {
      email: email,
      exp: 1.hour.from_now.to_i
    }
    # set login_token to validate last sent login token
    self.login_token = generate_token(payload)
    save!
  end

  def generate_auth_token
    self.login_token = nil
    self.login_token_verified_at = Time.now
    self.save

    payload = {
      user_id: id,
      login_token_verified_at: login_token_verified_at,
      exp: 1.day.from_now.to_i
    }

    generate_token(payload)
  end

  def login_link(request_origin)
    "#{request_origin}/auth?login_token=#{login_token}"
  end

  private

  def downcase_email
    self.email = email.downcase
  end

  def generate_token(token_payload)
    JsonWebToken.encode(token_payload)
  end
end
