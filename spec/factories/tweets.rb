FactoryBot.define do
  factory :tweet do
    content { 'my tweet' }
    user
  end
end
