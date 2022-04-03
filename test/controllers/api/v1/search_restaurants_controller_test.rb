require "test_helper"

class Api::V1::SearchRestaurantsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_search_restaurants_index_url
    assert_response :success
  end
end
