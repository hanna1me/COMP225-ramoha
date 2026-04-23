require "test_helper"

class InterestedeventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get interestedevents_url
    assert_response :success
  end
end
