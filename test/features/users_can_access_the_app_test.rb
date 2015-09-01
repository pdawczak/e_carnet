require "test_helper"

class UsersCanAccessTheAppTest < Capybara::Rails::TestCase
  include UserAuth

  test "new client cant register" do
    visit "/"
    assert_text page, "Register as Client"
    click_link "Register as Client"

    within("#new-client") do
      fill_in "Email", with: "test@user.com"
      fill_in "Password", with: COMMON_PASSWORD
      fill_in "Password confirmation", with: COMMON_PASSWORD
      click_button "Register"
    end

    assert_text page, "Welcome test@user.com. You've been registered correctly!"
  end
end
