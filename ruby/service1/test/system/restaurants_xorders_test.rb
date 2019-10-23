require "application_system_test_case"

class RestaurantsXordersTest < ApplicationSystemTestCase
  setup do
    @restaurants_xorder = restaurants_xorders(:one)
  end

  test "visiting the index" do
    visit restaurants_xorders_url
    assert_selector "h1", text: "Restaurants Xorders"
  end

  test "creating a Restaurants xorder" do
    visit restaurants_xorders_url
    click_on "New Restaurants Xorder"

    fill_in "Idorders", with: @restaurants_xorder.idOrders
    fill_in "Idrestaurants", with: @restaurants_xorder.idRestaurants
    click_on "Create Restaurants xorder"

    assert_text "Restaurants xorder was successfully created"
    click_on "Back"
  end

  test "updating a Restaurants xorder" do
    visit restaurants_xorders_url
    click_on "Edit", match: :first

    fill_in "Idorders", with: @restaurants_xorder.idOrders
    fill_in "Idrestaurants", with: @restaurants_xorder.idRestaurants
    click_on "Update Restaurants xorder"

    assert_text "Restaurants xorder was successfully updated"
    click_on "Back"
  end

  test "destroying a Restaurants xorder" do
    visit restaurants_xorders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Restaurants xorder was successfully destroyed"
  end
end
