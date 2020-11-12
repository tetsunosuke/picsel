require 'test_helper'

class Admins::LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admins_likes_create_url
    assert_response :success
  end

  test "should get delete" do
    get admins_likes_delete_url
    assert_response :success
  end

  test "should get index" do
    get admins_likes_index_url
    assert_response :success
  end

end
