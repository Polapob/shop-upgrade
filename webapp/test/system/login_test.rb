require "application_system_test_case"

class LoginTest < ApplicationSystemTestCase
  setup do
    # admin
    @admin_email = "admin@gmail.com"
    @admin_pwd = "111"

    # buyer
    @buyer_email = "buyer@gmail.com"
    @buyer_pwd = "1111"

    # seller
    @seller_email = "seller@gmail.com"
    @seller_pwd = "2222"
  end

  test "visit login page" do
    visit "/login"
    assert_selector "nav"
  end

  test "type into box" do
    visit "/login"
  end 

  test "login success" do
    visit "/login"
  end

  test "login fail"  do
    visit "login"
  end

end
