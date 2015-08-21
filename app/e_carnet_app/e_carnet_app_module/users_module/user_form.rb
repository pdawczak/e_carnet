module ECarnetAppModule
  module UsersModule
    class UserForm < Reform::Form
      property :email
      property :password
      property :password_confirmation
    end
  end
end
