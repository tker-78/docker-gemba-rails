FactoryBot.define do
  factory :user do
    name { "Takuya Kinoshita" }
    email { "aaa@gmail.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
