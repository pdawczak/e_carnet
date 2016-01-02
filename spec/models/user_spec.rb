require "rails_helper"

RSpec.describe User, type: :model do
  describe "properties" do
    subject { User.new }

    it { is_expected.to respond_to :email }
    it { is_expected.to respond_to :password }
  end

  describe "#clients" do
    it "consists list of users of type client" do
      client = create(:client)

      clients = User.clients

      expect(clients.to_a).to eq([client])
    end
  end

  describe "#professionals" do
    it "consists list of users of type professional" do
      professional = create(:professional)

      professionals = User.professionals

      expect(professionals.to_a).to eq([professional])
    end
  end

  describe "#new_client" do
    it "build new user of type client" do
      client = User.new_client(email: "test@example.com")

      expect(client.email).to eq("test@example.com")
      expect(client.type).to  eq("client")
    end
  end

  describe "#new_professional" do
    it "build new user of type professional" do
      client = User.new_professional(email: "test@example.com")

      expect(client.email).to eq("test@example.com")
      expect(client.type).to  eq("professional")
    end
  end
end
