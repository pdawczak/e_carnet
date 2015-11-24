require "rails_helper"
# require_relative "../../../app/lib/users/user_provider"

RSpec.describe Users::UserProvider do
  describe "#find_current_user_by_id" do
    context "when user is created and valid id is passed" do
      it "returns the user" do
        user = create(:client)

        found_user = Users::UserProvider.find_current_user_by_id(user.id)

        expect(found_user).to eq(user)
      end
    end

    context "when no id passed" do
      it "returns a Guest" do
        found_user = Users::UserProvider.find_current_user_by_id(nil)

        expect(found_user).to be_kind_of(Guest)
      end
    end

    context "when invalid id passed" do
      it "raises an error" do
        expect {
          Users::UserProvider.find_current_user_by_id("non-existing-id")
        }.to raise_error Users::UserProvider::NoCurrentUserFoundError
      end
    end
  end
end
