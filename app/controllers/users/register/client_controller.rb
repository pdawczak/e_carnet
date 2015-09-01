class Users::Register::ClientController < ApplicationController
  def new
    @form = app.users.new_client_form
  end

  def create
    @form = app.users.new_client_form
    if @form.validate(user_params)
      @form.save
      redirect_to root_url, notice: "Welcome #{@form.model.email}. You've been registered correctly!"
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user)
          .permit(:email, :password, :password_confirmation)
  end
end
