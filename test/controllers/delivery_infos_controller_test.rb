require "test_helper"

class DeliveryInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @delivery_info = delivery_infos(:one)
  end

  test "should get index" do
    get delivery_infos_url, as: :json
    assert_response :success
  end

  test "should create delivery_info" do
    assert_difference("DeliveryInfo.count") do
      post delivery_infos_url, params: { delivery_info: { asap: @delivery_info.asap, order_id: @delivery_info.order_id, scheduled: @delivery_info.scheduled, shippingAddress: @delivery_info.shippingAddress, toShip: @delivery_info.toShip } }, as: :json
    end

    assert_response :created
  end

  test "should show delivery_info" do
    get delivery_info_url(@delivery_info), as: :json
    assert_response :success
  end

  test "should update delivery_info" do
    patch delivery_info_url(@delivery_info), params: { delivery_info: { asap: @delivery_info.asap, order_id: @delivery_info.order_id, scheduled: @delivery_info.scheduled, shippingAddress: @delivery_info.shippingAddress, toShip: @delivery_info.toShip } }, as: :json
    assert_response :success
  end

  test "should destroy delivery_info" do
    assert_difference("DeliveryInfo.count", -1) do
      delete delivery_info_url(@delivery_info), as: :json
    end

    assert_response :no_content
  end
end
