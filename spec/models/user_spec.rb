require "rails_helper"

RSpec.describe User, type: :model do
  describe "properties" do
    subject { User.new }

    it { is_expected.to respond_to :email }
    it { is_expected.to respond_to :password }
  end

  describe "#find_current_user_by_id" do
    context "when user is created and valid id is passed" do
      it "returns the user" do
        user = create(:client)

        found_user = User.find_current_user_by_id(user.id)

        expect(found_user).to eq(user)
      end
    end

    context "when no id passed" do
      it "returns a Guest" do
        found_user = User.find_current_user_by_id(nil)

        expect(found_user).to be_kind_of(Guest)
      end
    end

    context "when invalid id passed" do
      it "raises an error" do
        expect {
          User.find_current_user_by_id("non-existing-id")
        }.to raise_error User::NoCurrentUserFoundError
      end
    end
  end

  describe "#new_client" do
    it "build new user of type client" do
      client = User.new_client(email: "test@example.com")

      expect(client.email).to eq("test@example.com")
      expect(client.type).to  eq("client")
    end
  end

  describe "#clients" do
    it "consists list of users of type client" do
      client = create(:client)

      clients = User.clients

      expect(clients.to_a).to eq([client])
    end
  end
end
