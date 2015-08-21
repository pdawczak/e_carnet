require "test_helper"

class UsersModuleTest < Minitest::Test
  def users
    ECarnetAppModule::Users.new(ECarnetApp.new(nil))
  end

  def test_it_can_be_initialized
    assert users
  end

  def test_returns_new_client_form
    assert_kind_of Reform::Form, users.new_client_form
  end
end
