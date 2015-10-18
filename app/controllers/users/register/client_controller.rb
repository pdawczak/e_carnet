class Users::Register::ClientController < ApplicationController
  def new
    @form = form_for_client
  end

  def create
    @form = form_for_client

    if @form.validate(params[:user])
      @form.save
      redirect_to root_url, notice: notice_for(@form.model)
    else
      render :new
    end
  end

  private

  def form_for_client
    UserForm.new(User.new_client)
  end

  def notice_for(user)
    "Welcome #{user.email}. You've been registered correctly!"
  end
end
