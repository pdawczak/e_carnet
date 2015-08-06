require "test_helper"

class StaticControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
  end
end
