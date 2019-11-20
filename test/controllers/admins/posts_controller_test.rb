require 'test_helper'

class Admins::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_posts_new_url
    assert_response :success
  end

  test "should get create" do
    get admins_posts_create_url
    assert_response :success
  end

  test "should get index" do
    get admins_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_posts_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_posts_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_posts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_posts_destroy_url
    assert_response :success
  end

end
