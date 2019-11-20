require 'test_helper'

class Admins::RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get follows" do
    get admins_relationships_follows_url
    assert_response :success
  end

  test "should get unfollows" do
    get admins_relationships_unfollows_url
    assert_response :success
  end

  test "should get follow" do
    get admins_relationships_follow_url
    assert_response :success
  end

  test "should get unfollow" do
    get admins_relationships_unfollow_url
    assert_response :success
  end

end
