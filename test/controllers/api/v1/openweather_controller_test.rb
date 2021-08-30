require "test_helper"

class Api::V1::OpenweatherControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_openweather_index_url
    assert_response :success
  end
end
