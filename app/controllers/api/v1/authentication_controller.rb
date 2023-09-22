class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authenticate_request!

  def create
    user = User.find_or_create_by!(email: params[:user][:email])
    request_origin = request.env['HTTP_ORIGIN']
    unless request_origin
      render json: { error: 'No HTTP_ORIGIN header provided' }, status: :bad_request
    else
      user.send_magic_link(request_origin)
      head :ok
    end
  end
end
