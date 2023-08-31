require "test_helper"

class ProductOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_option = product_options(:one)
  end

  test "should get index" do
    get product_options_url, as: :json
    assert_response :success
  end

  test "should create product_option" do
    assert_difference("ProductOption.count") do
      post product_options_url, params: { product_option: { description: @product_option.description, hidden: @product_option.hidden, name: @product_option.name, price: @product_option.price, product_id: @product_option.product_id, quantity: @product_option.quantity } }, as: :json
    end

    assert_response :created
  end

  test "should show product_option" do
    get product_option_url(@product_option), as: :json
    assert_response :success
  end

  test "should update product_option" do
    patch product_option_url(@product_option), params: { product_option: { description: @product_option.description, hidden: @product_option.hidden, name: @product_option.name, price: @product_option.price, product_id: @product_option.product_id, quantity: @product_option.quantity } }, as: :json
    assert_response :success
  end

  test "should destroy product_option" do
    assert_difference("ProductOption.count", -1) do
      delete product_option_url(@product_option), as: :json
    end

    assert_response :no_content
  end
end
