require 'test_helper'

class RestaurantsXordersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurants_xorder = restaurants_xorders(:one)
  end

  test "should get index" do
    get restaurants_xorders_url
    assert_response :success
  end

  test "should get new" do
    get new_restaurants_xorder_url
    assert_response :success
  end

  test "should create restaurants_xorder" do
    assert_difference('RestaurantsXorder.count') do
      post restaurants_xorders_url, params: { restaurants_xorder: { idOrders: @restaurants_xorder.idOrders, idRestaurants: @restaurants_xorder.idRestaurants } }
    end

    assert_redirected_to restaurants_xorder_url(RestaurantsXorder.last)
  end

  test "should show restaurants_xorder" do
    get restaurants_xorder_url(@restaurants_xorder)
    assert_response :success
  end

  test "should get edit" do
    get edit_restaurants_xorder_url(@restaurants_xorder)
    assert_response :success
  end

  test "should update restaurants_xorder" do
    patch restaurants_xorder_url(@restaurants_xorder), params: { restaurants_xorder: { idOrders: @restaurants_xorder.idOrders, idRestaurants: @restaurants_xorder.idRestaurants } }
    assert_redirected_to restaurants_xorder_url(@restaurants_xorder)
  end

  test "should destroy restaurants_xorder" do
    assert_difference('RestaurantsXorder.count', -1) do
      delete restaurants_xorder_url(@restaurants_xorder)
    end

    assert_redirected_to restaurants_xorders_url
  end
end
