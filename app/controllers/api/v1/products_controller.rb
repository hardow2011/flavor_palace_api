class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: %i[ show update destroy verify_options_existence ]
  before_action :verify_options_existence, only: [:update]
  skip_before_action :authenticate_request!, only: [:index, :show, :find_by_permalink]

  # GET /products
  def index
    @products = Product.all

    render json: @products
  end

  # GET /products/1
  def show
    render json: @product
  end

  def find_by_permalink
    product = Product.find_by_permalink(params[:permalink])
    render json: product
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: api_v1_product_url(@product)
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :hidden, product_options_attributes: [:id, :name, :quantity, :price, :description, :default_description, :hidden, :_destroy])
  end

  def verify_options_existence
    # If there are no options not marked with destroy, that is, if all options are set to be destroyed
    non_destroyed_options = params[:product][:product_options_attributes].reject { |po| po[:_destroy] == "true" }
    if non_destroyed_options.empty?
      @product.add_no_options_error
      render json: @product.errors, status: :unprocessable_entity
    end
  end
end
