class User < ActiveRecord::Base
  class << self
    def find_current_user_by_id(user_id)
      return ECarnetApp::Guest.new if user_id.nil?
      where(id: user_id).first
    end
  end
end
