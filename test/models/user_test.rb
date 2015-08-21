require "test_helper"

class UserTest < ActiveSupport::TestCase
  def user
    @user ||= User.new
  end

  def test_properties
    assert_respond_to user, :email
    assert_respond_to user, :password
  end

  def test_find_current_user_by_id
    user = User.find_current_user_by_id(users(:joe).id)
    assert_kind_of User, user

    guest = User.find_current_user_by_id(nil)
    assert_kind_of ECarnetAppModule::UsersModule::Guest, guest
  end
end
