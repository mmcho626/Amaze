require 'test_helper'

class Admins::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admins_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_comments_destroy_url
    assert_response :success
  end

end
