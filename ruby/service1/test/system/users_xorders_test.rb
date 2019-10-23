require "application_system_test_case"

class UsersXordersTest < ApplicationSystemTestCase
  setup do
    @users_xorder = users_xorders(:one)
  end

  test "visiting the index" do
    visit users_xorders_url
    assert_selector "h1", text: "Users Xorders"
  end

  test "creating a Users xorder" do
    visit users_xorders_url
    click_on "New Users Xorder"

    fill_in "Idorders", with: @users_xorder.idOrders
    fill_in "Idusers", with: @users_xorder.idUsers
    click_on "Create Users xorder"

    assert_text "Users xorder was successfully created"
    click_on "Back"
  end

  test "updating a Users xorder" do
    visit users_xorders_url
    click_on "Edit", match: :first

    fill_in "Idorders", with: @users_xorder.idOrders
    fill_in "Idusers", with: @users_xorder.idUsers
    click_on "Update Users xorder"

    assert_text "Users xorder was successfully updated"
    click_on "Back"
  end

  test "destroying a Users xorder" do
    visit users_xorders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Users xorder was successfully destroyed"
  end
end
