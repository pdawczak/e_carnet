require "test_helper"

class ECarnetAppTest < Minitest::Test
  def test_instantiates_new_app_with_user_id
    ECarnetApp.for_user_by_id(nil)
  end
end
