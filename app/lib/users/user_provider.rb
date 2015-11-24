module Users
  class UserProvider
    class NoCurrentUserFoundError < RuntimeError; end

    class << self
      def find_current_user_by_id(user_id = nil)
        return Guest.new if user_id.nil?
        User.find_by_id(user_id) or raise NoCurrentUserFoundError
      end
    end
  end
end
