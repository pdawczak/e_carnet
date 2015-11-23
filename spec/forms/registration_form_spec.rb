require "rails_helper"

RSpec.describe RegistrationForm do
  describe "properties" do
    subject { RegistrationForm.new(OpenStruct.new) }

    it { is_expected.to respond_to :email }
    it { is_expected.to respond_to :password }
    it { is_expected.to respond_to :password_confirmation }
  end

  describe "validation" do
    context "email" do
      it "is valid" do
        form = RegistrationForm.new(OpenStruct.new)

        form.validate({ email: "test@tester.com" })

        expect(form.errors[:email]).to be_empty
      end

      it "is required" do
        form = RegistrationForm.new(OpenStruct.new)

        form.validate({ email: "" })

        expect(form.errors[:email].size).to eq(1)
      end

      it "is of proper format" do
        form = RegistrationForm.new(OpenStruct.new)

        form.validate({ email: "JustTest" })

        expect(form.errors[:email].size).to eq(1)
      end
    end

    context "password" do
      it "is valid" do
        form = RegistrationForm.new(OpenStruct.new)

        form.validate({ password:              "TestPass123",
                        password_confirmation: "TestPass123" })

        expect(form.errors[:password]).to be_empty
        expect(form.errors[:password_confirmation]).to be_empty
      end

      it "is required" do
        form = RegistrationForm.new(OpenStruct.new)

        form.validate({ password:              "",
                        password_confirmation: "" })

        expect(form.errors[:password].size).to eq(1)
        expect(form.errors[:password_confirmation].size).to eq(1)
      end
    end
  end
end
