require 'rails_helper'

RSpec.describe Users::Register::ProfessionalController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :new

      expect(response).to be_success
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with invalid arguments" do
      it "re-renders the form" do
        user_params = {}

        post :create, user: user_params

        expect(response).to render_template(:new)
      end
    end

    context "with valid arguments" do
      it "creates new professional account" do
        professional_params = attributes_for(:professional, password: "test123",
                                                            password_confirmation: "test123")

        expect {
          post :create, user: professional_params
        }.to change { User.professionals.count }.by(1)
      end
    end
  end
end
