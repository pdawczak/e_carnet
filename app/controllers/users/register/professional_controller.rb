class Users::Register::ProfessionalController < ApplicationController
  def new
    @form = form_for_professional
  end

  def create
    @form = form_for_professional

    if @form.validate(params[:user])
      @form.save
      redirect_to root_path, notice: notice_for(@form.model)
    else
      render :new
    end
  end

  private

  def form_for_professional
    RegistrationForm.new(User.new_professional)
  end

  def notice_for(user)
    "Welcome #{user.email}. Your professional account has been created!"
  end
end
