require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get api_v1_users_new_url
    assert_response :success
  end
end
