require 'test_helper'

class Articles2ControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get articles2_show_url
    assert_response :success
  end

end
