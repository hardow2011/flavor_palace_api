class Api::V1::DeliveryInfosController < ApplicationController
  before_action :set_delivery_info, only: %i[ show update destroy ]

  # GET /delivery_infos
  def index
    @delivery_infos = DeliveryInfo.all

    render json: @delivery_infos
  end

  # GET /delivery_infos/1
  def show
    render json: @delivery_info
  end

  # POST /delivery_infos
  def create
    @delivery_info = DeliveryInfo.new(delivery_info_params)

    if @delivery_info.save
      render json: @delivery_info, status: :created, location: @delivery_info
    else
      render json: @delivery_info.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /delivery_infos/1
  def update
    if @delivery_info.update(delivery_info_params)
      render json: @delivery_info
    else
      render json: @delivery_info.errors, status: :unprocessable_entity
    end
  end

  # DELETE /delivery_infos/1
  def destroy
    @delivery_info.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery_info
      @delivery_info = DeliveryInfo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def delivery_info_params
      params.require(:delivery_info).permit(:toShip, :shippingAddress, :asap, :scheduled, :order_id)
    end
end
