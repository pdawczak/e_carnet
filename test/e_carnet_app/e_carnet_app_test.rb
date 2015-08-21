require "test_helper"
require "ostruct"

class ECarnetAppTest < Minitest::Test
  def app
    @app ||= ECarnetApp.new(OpenStruct.new)
  end

  def test_instantiates_new_app_with_user_id
    ECarnetApp.for_user_by_id(nil)
  end

  def test_current_user
    user = OpenStruct.new
    assert_equal ECarnetApp.new(user).current_user, user
  end

  def test_users
    assert_kind_of ECarnetAppModule::Users, app.users
  end
end
