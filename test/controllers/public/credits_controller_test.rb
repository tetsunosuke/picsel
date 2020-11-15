require 'test_helper'

class Public::CreditsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_credits_new_url
    assert_response :success
  end

  test "should get create" do
    get public_credits_create_url
    assert_response :success
  end

end
