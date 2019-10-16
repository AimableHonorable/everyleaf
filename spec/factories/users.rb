FactoryBot.define do
  factory :user do
    firstname { "mugabo" }
    lastname { "Aimable" }
    email { "aimable@gmail.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
