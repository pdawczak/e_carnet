require "test_helper"

class Users::Register::ClientControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference "User.clients.count" do
      post :create, user: { email:                 "sample_email@test.com",
                      password:              "SamplePassword",
                      password_confirmation: "SamplePassword" }
    end
  end
end
