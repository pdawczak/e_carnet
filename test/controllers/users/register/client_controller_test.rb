require "test_helper"

class Users::Register::ClientControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_response :success
  end

  def test_create
    user_params = { email:                 "sample_email@test.com",
                    password:              "SamplePassword",
                    password_confirmation: "SamplePassword" }

    assert_difference "User.clients.count" do
      post :create, user: user_params
    end
  end
end
