FactoryBot.define do
  factory :user do
    full_name { Faker::Name.name }
    username { Faker::Internet.domain_word  }
    email { Faker::Internet.email }
    password { 'secret' }
    password_confirmation { 'secret' }
  end
end
