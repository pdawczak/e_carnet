class ECarnetApp
  attr_reader :current_user

  def initialize(user)
    @current_user = user
  end

  class << self
    def for_user_by_id(user_id)
      new(User.find_current_user_by_id(user_id))
    end
  end

  def users
    ECarnetAppModule::Users.new(self)
  end
end
