require "test_helper"

class HistoryControllerTest < ActionDispatch::IntegrationTest
  test "should get sale" do
    get history_sale_url
    assert_response :success
  end

  test "should get purchase" do
    get history_purchase_url
    assert_response :success
  end
end
