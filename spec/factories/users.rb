# https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#configure-your-test-suite
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    pets_name { 'Snoopy' }
    password { 'password123' }
  end
end
