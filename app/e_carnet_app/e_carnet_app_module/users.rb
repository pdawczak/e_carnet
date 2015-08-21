module ECarnetAppModule
  class Users
    def initialize(app)
      @app = app
    end

    def new_client_form
      UsersModule::UserForm.new(User.new)
    end
  end
end
