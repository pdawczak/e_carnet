FactoryGirl.define do
  factory :user do
    email    Faker::Internet.email
    password BCrypt::Password.create("QwerTy123")
    type     [:client].sample

    factory :client do
      type :client
    end
  end
end