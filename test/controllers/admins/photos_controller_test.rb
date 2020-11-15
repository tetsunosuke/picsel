require 'test_helper'

class Admins::PhotosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_photos_index_url
    assert_response :success
  end

  test "should get edit" do
    get admins_photos_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_photos_update_url
    assert_response :success
  end

  test "should get delete" do
    get admins_photos_delete_url
    assert_response :success
  end

  test "should get show" do
    get admins_photos_show_url
    assert_response :success
  end

end
