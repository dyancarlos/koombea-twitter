FactoryBot.define do
  factory :user do
    full_name { Faker::Name.name }
    username { Faker::Internet.username(specifier: 6) }
    email { Faker::Internet.email }
    password { 'secret' }
    password_confirmation { 'secret' }
  end
end
