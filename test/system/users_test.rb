require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "Address", with: @user.address
    check "Admin" if @user.admin
    fill_in "Covid safe certifcate", with: @user.covid_safe_certifcate
    fill_in "Email", with: @user.email
    fill_in "Image", with: @user.image
    fill_in "Last name", with: @user.last_name
    fill_in "Latitude", with: @user.latitude
    fill_in "Longitude", with: @user.longitude
    fill_in "Name", with: @user.name
    fill_in "National", with: @user.national_id
    fill_in "Password digest", with: @user.password_digest
    fill_in "Police check", with: @user.police_check
    check "User active" if @user.user_active
    fill_in "User type", with: @user.user_type
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    fill_in "Address", with: @user.address
    check "Admin" if @user.admin
    fill_in "Covid safe certifcate", with: @user.covid_safe_certifcate
    fill_in "Email", with: @user.email
    fill_in "Image", with: @user.image
    fill_in "Last name", with: @user.last_name
    fill_in "Latitude", with: @user.latitude
    fill_in "Longitude", with: @user.longitude
    fill_in "Name", with: @user.name
    fill_in "National", with: @user.national_id
    fill_in "Password digest", with: @user.password_digest
    fill_in "Police check", with: @user.police_check
    check "User active" if @user.user_active
    fill_in "User type", with: @user.user_type
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
