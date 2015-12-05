require "rails_helper"

RSpec.describe Users::Register::ClientController, type: :controller do
  describe "GET #new" do
    it "renders form page" do
      get :new

      expect(response).to be_success
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "creates new client" do
        user_params = {}

        post :create, user: user_params

        expect(response).to render_template(:new)
      end
    end

    context "with valid params" do
      it "creates new client" do
        user_params = attributes_for(:client, password: "test123",
                                              password_confirmation: "test123")

        expect {
          post :create, user: user_params
        }.to change { User.clients.count }.by(1)
      end
    end
  end
end
