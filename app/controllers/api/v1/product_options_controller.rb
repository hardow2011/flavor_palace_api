class Api::V1::ProductOptionsController < ApplicationController
  before_action :set_product_option, only: %i[ show update destroy ]

  # GET /product_options
  def index
    @product_options = ProductOption.all

    render json: @product_options
  end

  # GET /product_options/1
  def show
    render json: @product_option
  end

  # POST /product_options
  def create
    @product_option = ProductOption.new(product_option_params)

    if @product_option.save
      render json: @product_option, status: :created, location: @product_option
    else
      render json: @product_option.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /product_options/1
  def update
    if @product_option.update(product_option_params)
      render json: @product_option
    else
      render json: @product_option.errors, status: :unprocessable_entity
    end
  end

  # DELETE /product_options/1
  def destroy
    @product_option.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_option
      @product_option = ProductOption.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_option_params
      params.require(:product_option).permit(:name, :quantity, :price, :description, :hidden, :product_id)
    end
end
