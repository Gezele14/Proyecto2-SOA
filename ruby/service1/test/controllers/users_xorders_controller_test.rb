require 'test_helper'

class UsersXordersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_xorder = users_xorders(:one)
  end

  test "should get index" do
    get users_xorders_url
    assert_response :success
  end

  test "should get new" do
    get new_users_xorder_url
    assert_response :success
  end

  test "should create users_xorder" do
    assert_difference('UsersXorder.count') do
      post users_xorders_url, params: { users_xorder: { idOrders: @users_xorder.idOrders, idUsers: @users_xorder.idUsers } }
    end

    assert_redirected_to users_xorder_url(UsersXorder.last)
  end

  test "should show users_xorder" do
    get users_xorder_url(@users_xorder)
    assert_response :success
  end

  test "should get edit" do
    get edit_users_xorder_url(@users_xorder)
    assert_response :success
  end

  test "should update users_xorder" do
    patch users_xorder_url(@users_xorder), params: { users_xorder: { idOrders: @users_xorder.idOrders, idUsers: @users_xorder.idUsers } }
    assert_redirected_to users_xorder_url(@users_xorder)
  end

  test "should destroy users_xorder" do
    assert_difference('UsersXorder.count', -1) do
      delete users_xorder_url(@users_xorder)
    end

    assert_redirected_to users_xorders_url
  end
end
