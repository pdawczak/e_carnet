class ECarnetApp
  attr_reader :user

  def initialize(user)
    @user = user
  end

  class << self
    def for_user_by_id(user_id)
      new(User.find_current_user_by_id(user_id))
    end
  end
end
