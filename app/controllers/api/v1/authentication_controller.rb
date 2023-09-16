class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authenticate_request!
  def create
    user = User.find_or_create_by!(email: params[:user][:email])
    user.send_magic_link
    head :ok
  end
end
