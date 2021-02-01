require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { address: @user.address, admin: @user.admin, covid_safe_certifcate: @user.covid_safe_certifcate, email: @user.email, image: @user.image, last_name: @user.last_name, latitude: @user.latitude, longitude: @user.longitude, name: @user.name, national_id: @user.national_id, password_digest: @user.password_digest, police_check: @user.police_check, user_active: @user.user_active, user_type: @user.user_type } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { address: @user.address, admin: @user.admin, covid_safe_certifcate: @user.covid_safe_certifcate, email: @user.email, image: @user.image, last_name: @user.last_name, latitude: @user.latitude, longitude: @user.longitude, name: @user.name, national_id: @user.national_id, password_digest: @user.password_digest, police_check: @user.police_check, user_active: @user.user_active, user_type: @user.user_type } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
