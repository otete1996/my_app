require 'test_helper'

class Posts2ControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get posts2_create_url
    assert_response :success
  end

  test "should get destroy" do
    get posts2_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get posts2_edit_url
    assert_response :success
  end

  test "should get update" do
    get posts2_update_url
    assert_response :success
  end

end
