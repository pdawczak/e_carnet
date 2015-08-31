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

  def test_new_client
    client = User.new_client(email: "test@example.com")
    assert_equal client.email, "test@example.com"
    assert_equal client.type, "client"
  end

  def test_clients
    client = User.new_client(password_digest: "123")
    refute_includes User.clients, client
    client.save
    assert_includes User.clients, client
  end
end
