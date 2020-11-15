require 'test_helper'

class Public::CardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_cards_index_url
    assert_response :success
  end

end
