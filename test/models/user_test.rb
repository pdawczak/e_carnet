require "test_helper"

class UserTest < ActiveSupport::TestCase
  def test_find_current_user_by_id
    user = User.find_current_user_by_id(users(:joe).id)
    assert_kind_of User, user

    guest = User.find_current_user_by_id(nil)
    assert_kind_of ECarnetAppModule::UsersModule::Guest, guest
  end
end
