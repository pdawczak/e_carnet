require "test_helper"

class CanAccessTheAppTest < Capybara::Rails::TestCase
  test "accesses the home page" do
    visit root_path
    assert_content page, "This is homepage!"
  end
end
