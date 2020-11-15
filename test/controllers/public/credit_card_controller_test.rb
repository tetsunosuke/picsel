require 'test_helper'

class Public::CreditCardControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get public_credit_card_edit_url
    assert_response :success
  end

  test "should get create" do
    get public_credit_card_create_url
    assert_response :success
  end

  test "should get delete" do
    get public_credit_card_delete_url
    assert_response :success
  end

  test "should get show" do
    get public_credit_card_show_url
    assert_response :success
  end

end
