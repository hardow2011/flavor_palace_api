class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate_request!
  def create
    login_token = params[:login_token].to_s
    decoded_token = JsonWebToken.decode(login_token)

    if decoded_token && JsonWebToken.valid_payload(decoded_token.first)
      user = User.find_by(login_token: login_token)
      if user
        render json: { auth_token: user.generate_auth_token }
      else
        render son: { error: 'Invalid Request' }, status: :unauthorized
      end
    else
      render son: { error: 'Invalid Request' }, status: :unauthorized
    end
  end
end
